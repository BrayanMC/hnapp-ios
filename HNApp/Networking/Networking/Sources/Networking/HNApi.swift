//
//  HNApi.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Foundation
import Helpers

public enum HNApi: URLRequestConvertible {
    case news
    
    public var baseURL: URL {
        return URL(string: "https://hn.algolia.com/api/v1")!
    }
    
    public var path: String {
        switch self {
        case .news:
            return "search_by_date"
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .news:
            return [URLQueryItem(name: "query", value: "mobile")]
        }
    }
    
    public var httpMethod: HTTPMethods {
        switch self {
        case .news:
            return .get
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .news:
            return nil
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .news:
            return nil
        }
    }
}
