//
//  Article.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import Foundation

struct Article: Codable, Hashable {
    var id = UUID().uuidString
    let title: String
    let url: String
    let author: String
    let createdAt: String
    
    var timeElapsed: String {
        return DateHelper.timeElapsedSince(dateString: createdAt) ?? "Unknown time"
    }
}

extension Article {
    
    init(from response: NewsResponse.HitResponse) {
        self.title = response.storyTitle ?? response.title ?? ""
        self.url = response.url ?? ""
        self.author = response.author ?? ""
        self.createdAt = response.createdAt ?? ""
    }
}
