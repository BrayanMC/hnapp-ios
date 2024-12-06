//
//  ArticleDataSource.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import SwiftData
import Foundation

final class ArticleDataSource: ArticleDataSourceProtocol {
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = ArticleDataSource()

    @MainActor
    private init() {
        let schema = Schema([
            ArticleModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            self.modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.modelContext = modelContainer.mainContext
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    func addArticle(article: ArticleModel) {
        modelContext.insert(article)
        print("Article added with ID: \(article.id)")
    }
    
    func fetchAllArticles() -> [ArticleModel] {
        do {
            let descriptor = FetchDescriptor<ArticleModel>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
            return try modelContext.fetch(descriptor)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateArticleIsDeleted(article: ArticleModel) {
        let model = ArticleModel(
            id: article.id,
            title: article.title,
            url: article.url,
            author: article.author,
            createdAt: article.createdAt,
            isDeleted: true
        )
        deleteArticle(article)
        addArticle(article: model)
    }
    
    func deleteArticle(_ article: ArticleModel) {
        modelContext.delete(article)
        print("Article deleted with ID: \(article.id)")
    }
}
