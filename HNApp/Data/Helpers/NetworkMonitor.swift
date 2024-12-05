//
//  NetworkMonitor.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Network
import Combine

class Reachability {
    
    static let shared = Reachability()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    private let subject = CurrentValueSubject<Bool, Never>(false)
    
    private init() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.subject.send(true)
            } else {
                self.subject.send(false)
            }
        }
        monitor.start(queue: queue)
    }
    
    func isNetworkReachable() -> AnyPublisher<Bool, Never> {
        return subject.eraseToAnyPublisher()
    }
}
