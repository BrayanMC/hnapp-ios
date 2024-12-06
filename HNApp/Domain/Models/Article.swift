//
//  Article.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import Foundation
import CommonHelpers

struct Article: Codable, Hashable {
    let id: Int
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
        self.id = response.storyID ?? 1
        self.title = response.storyTitle ?? response.title ?? ""
        self.url = response.url ?? ""
        self.author = response.author ?? ""
        self.createdAt = response.createdAt ?? ""
    }
}


extension Article {
    
    func mapTo() -> ArticleModel {
        ArticleModel(
            id: self.id,
            title: self.title,
            url: self.url,
            author: self.author,
            createdAt: self.createdAt
        )
    }
}
