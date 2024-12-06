//
//  ArticleDataSourceProtocol.swift
//  HNApp
//
//  Created by Brayan Munoz on 6/12/24.
//

protocol ArticleDataSourceProtocol {
    func addArticle(article: ArticleModel)
    func fetchAllArticles() -> [ArticleModel]
    func updateArticleIsDeleted(article: ArticleModel)
    func deleteArticle(_ article: ArticleModel)
}
