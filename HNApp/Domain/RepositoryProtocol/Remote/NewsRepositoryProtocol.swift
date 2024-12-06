//
//  NewsRepositoryProtocol.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Combine
import NetworkingCore

protocol NewsRepositoryProtocol {
    func fetchArticles() -> AnyPublisher<NewsResponse?, ServiceError>
}
