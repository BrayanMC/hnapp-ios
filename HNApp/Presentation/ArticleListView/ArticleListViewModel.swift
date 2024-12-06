//
//  ArticleListViewModel.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import Combine
import SwiftData
import Helpers
import Networking

class ArticleListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let newsService: NewsServiceProtocol
    
    private let dataSource: ArticleDataSource
    
    init(dataSource: ArticleDataSource) {
        let serviceManager = ServiceManager()
        self.newsService = NewsService(serviceManager: serviceManager)
        self.dataSource = dataSource
    }
    
    func fetchArticles() {
        NetworkMonitor.shared.isNetworkReachable()
            .sink { isReachable in
                if isReachable {
                    self.fetchArticlesFromNetwork()
                } else {
                    self.fetchArticlesFromLocal()
                }
            }
            .store(in: &cancellables)
    }
    
    private func fetchArticlesFromNetwork() {
        newsService.fetchArticles()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Error: \(error)"
                }
            }, receiveValue: { response in
                guard let response = response, let hits = response.hits else {
                    self.articles = []
                    return
                }
                
                var articles: [Article] = []
                hits.forEach { value in
                    articles.append(Article(from: value))
                }

                self.processFetchedArticles(articles)
            })
            .store(in: &cancellables)
    }
    
    private func fetchArticlesFromLocal() {
        let allArticles = dataSource.fetchAllArticles()
        let savedArticles = allArticles.filter { !$0.isDeleted }
        
        self.articles = savedArticles.map { articleModel in
            Article(
                id: articleModel.id,
                title: articleModel.title,
                url: articleModel.url,
                author: articleModel.author,
                createdAt: articleModel.createdAt
            )
        }
        
        print("Fetched \(savedArticles.count) articles from local storage.")
        print("All articles (including deleted):")
        allArticles.forEach { article in
            print("ID: \(article.id), Title: \(article.title), isDeleted: \(article.isDeleted)")
        }
    }

    private func processFetchedArticles(_ articles: [Article]) {
        let savedArticles = dataSource.fetchAllArticles()
        let savedArticleIDs = Set(savedArticles.map { $0.id })
        let deletedArticleIDs = Set(savedArticles.filter { $0.isDeleted }.map { $0.id })
        
        let newArticles = articles.filter { !savedArticleIDs.contains($0.id) }
        let nonDeletedArticles = articles.filter { !deletedArticleIDs.contains($0.id) }
        
        print("Processing fetched articles: \(articles.count) total, \(newArticles.count) new, \(nonDeletedArticles.count) non-deleted.")
        
        self.saveArticles(newArticles)
        self.articles = nonDeletedArticles
    }

    private func saveArticles(_ articles: [Article]) {
        let savedArticles = dataSource.fetchAllArticles()
        let deletedArticleIDs = Set(savedArticles.filter { $0.isDeleted }.map { $0.id })
        
        articles.forEach { article in
            if !deletedArticleIDs.contains(article.id) {
                if !savedArticles.contains(where: { $0.id == article.id }) {
                    let model = ArticleModel(
                        id: article.id,
                        title: article.title,
                        url: article.url,
                        author: article.author,
                        createdAt: article.createdAt
                    )
                    dataSource.addArticle(article: model)
                }
            }
        }
    }

    func delete(article: Article) {
        if let modelToDelete = dataSource.fetchAllArticles().first(where: { $0.id == article.id }) {
            dataSource.updateArticleIsDeleted(article: modelToDelete)
            fetchArticlesFromLocal()
        } else {
            print("Article with ID: \(article.id) not found")
        }
    }
}
