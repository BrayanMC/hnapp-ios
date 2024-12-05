//
//  HNApi.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Foundation

enum HNApi: URLRequestConvertible {
    case news
    
    var baseURL: URL {
        return URL(string: "https://hn.algolia.com/api/v1")!
    }
    
    var path: String {
        switch self {
        case .news:
            return "search_by_date"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .news:
            return [URLQueryItem(name: "query", value: "mobile")]
        }
    }
    
    var httpMethod: HTTPMethods {
        switch self {
        case .news:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .news:
            return nil
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .news:
            return nil
        }
    }
}
