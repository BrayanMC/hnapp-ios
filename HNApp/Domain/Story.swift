//
//  Story.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import Foundation

struct Story: Codable, Hashable {
    var id = UUID().uuidString
    let title: String
    let url: String
    let author: String
    let createdAt: String
    
    var timeElapsed: String {
        return DateHelper.timeElapsedSince(dateString: createdAt) ?? "Unknown time"
    }
}
