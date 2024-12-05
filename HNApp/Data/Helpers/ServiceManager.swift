//
//  ServiceManager.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Foundation
import Combine

final class ServiceManager {
    
    private var cancellables = Set<AnyCancellable>()
    
    func request<T: Codable>(_ request: URLRequestConvertible, type: T.Type) -> AnyPublisher<T?, ServiceError> {
        let urlRequest = request.urlRequest()
        print("Starting request: \(urlRequest.url?.absoluteString ?? "Unknown URL")")
        
        return Reachability.shared.isNetworkReachable()
            .flatMap { isReachable -> AnyPublisher<T?, ServiceError> in
                if isReachable {
                    return URLSession.shared.dataTaskPublisher(for: urlRequest)
                        .tryMap { data, response -> T? in
                            guard let httpResponse = response as? HTTPURLResponse else {
                                throw ServiceError.invalidResponse
                            }
                            
                            print("Received response: \(httpResponse.statusCode) for URL: \(urlRequest.url?.absoluteString ?? "Unknown URL")")
                            
                            switch httpResponse.statusCode {
                            case 200...299:
                                if let utf8String = String(data: data, encoding: .utf8) {
                                    print("Response data in UTF-8: \(utf8String)")
                                } else {
                                    print("Failed to convert data to UTF-8 string")
                                }
                                
                                #if DEBUG
                                print("------\(httpResponse.statusCode)------\(request.urlRequest())------\(httpResponse.statusCode)------")
                                #endif
                                
                                do {
                                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                                    print("Decoded data: \(decodedData)")
                                    return decodedData
                                } catch {
                                    print("Decoding error: \(error)")
                                    throw ServiceError.invalidResponse
                                }
                            case 401:
                                #if DEBUG
                                print("------\(httpResponse.statusCode)------\(request.urlRequest())------\(httpResponse.statusCode)------")
                                #endif
                                throw ServiceError.unauthorized
                            case 429:
                                #if DEBUG
                                print("------\(httpResponse.statusCode)------\(request.urlRequest())------\(httpResponse.statusCode)------")
                                #endif
                                throw ServiceError.rateLimit
                            default:
                                #if DEBUG
                                print("------\(httpResponse.statusCode)------\(request.urlRequest())------\(httpResponse.statusCode)------")
                                #endif
                                throw ServiceError.invalidResponse
                            }
                        }
                        .mapError { error -> ServiceError in
                            print("Request failed with error: \(error)")
                            if let serviceError = error as? ServiceError {
                                return serviceError
                            } else {
                                return .invalidURLRequest
                            }
                        }
                        .eraseToAnyPublisher()
                } else {
                    print("No network connection")
                    return Fail(error: ServiceError.noConnection)
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
