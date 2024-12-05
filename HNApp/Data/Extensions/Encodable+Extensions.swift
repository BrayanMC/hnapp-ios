//
//  Encodable+Extensions.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Foundation

extension Encodable {
    
    func convertToDictionary() -> [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            guard let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
                return nil
            }
            return jsonObject
        } catch {
            print("JSON encoding error: \(error)")
            return nil
        }
    }
}
