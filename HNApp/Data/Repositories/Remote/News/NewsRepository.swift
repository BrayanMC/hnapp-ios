//
//  NewsService.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Combine
import NetworkingCore

class NewsRepository: NewsRepositoryProtocol {
    
    private let serviceManager: ServiceManager
    
    init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
    
    func fetchArticles() -> AnyPublisher<NewsResponse?, ServiceError> {
        serviceManager.request(HNApi.news, type: NewsResponse.self)
    }
}
