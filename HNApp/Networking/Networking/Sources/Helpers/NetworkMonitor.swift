//
//  NetworkMonitor.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Foundation
import Combine
import Network

public final class NetworkMonitor: @unchecked Sendable {
    
    private static let queue = DispatchQueue(label: "NetworkMonitor.shared.queue")
    public static let shared: NetworkMonitor = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private let monitorQueue = DispatchQueue(label: "NetworkMonitor")
    private let subject = CurrentValueSubject<Bool, Never>(false)
    
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            if path.status == .satisfied {
                self.subject.send(true)
            } else {
                self.subject.send(false)
            }
        }
        monitor.start(queue: monitorQueue)
    }
    
    public func isNetworkReachable() -> AnyPublisher<Bool, Never> {
        return subject.eraseToAnyPublisher()
    }
}
