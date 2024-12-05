//
//  ArticleListViewModel.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import Combine

class ArticleListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    private let newsService: NewsServiceProtocol
    
    init() {
        let serviceManager = ServiceManager()
        self.newsService = NewsService(serviceManager: serviceManager)
    }
    
    func fetchArticles() {
        let serviceManager = ServiceManager()
        let newsService = NewsService(serviceManager: serviceManager)
        
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
                
                self.articles = articles
            })
            .store(in: &cancellables)
    }
}
