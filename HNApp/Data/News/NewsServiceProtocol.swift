//
//  NewsServiceProtocol.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Combine

protocol NewsServiceProtocol {
    func fetchArticles() -> AnyPublisher<NewsResponse?, ServiceError>
}
