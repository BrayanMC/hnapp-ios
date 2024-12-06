//
//  ArticleModel.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import SwiftData

@Model
final class ArticleModel {
    var id: Int
    var title: String
    var url: String
    var author: String
    var createdAt: String
    var isDeleted: Bool
    
    init(id: Int, title: String, url: String, author: String, createdAt: String, isDeleted: Bool = false) {
        self.id = id
        self.title = title
        self.url = url
        self.author = author
        self.createdAt = createdAt
        self.isDeleted = isDeleted
    }
}
