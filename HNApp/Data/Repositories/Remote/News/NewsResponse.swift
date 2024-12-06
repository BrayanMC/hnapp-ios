//
//  NewsResponse.swift
//  HNApp
//
//  Created by Brayan Munoz on 5/12/24.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let hits: [HitResponse]?
    let hitsPerPage, nbHits, nbPages, page: Int?
    let params: String?
    let processingTimeMS: Int?
    let query: String?
    let serverTimeMS: Int?

    // MARK: - HitResponse
    struct HitResponse: Codable {
        let tags: [String]?
        let author: String?
        let createdAt: String?
        let createdAtI: Int?
        let numComments: Int?
        let objectID: String
        let points: Int?
        let storyID: Int?
        let title: String?
        let storyTitle: String?
        let updatedAt: String?
        let url: String?

        enum CodingKeys: String, CodingKey {
            case tags = "_tags"
            case author
            case createdAt = "created_at"
            case createdAtI = "created_at_i"
            case numComments = "num_comments"
            case objectID, points
            case storyID = "story_id"
            case title
            case storyTitle = "story_title"
            case updatedAt = "updated_at"
            case url = "story_url"
        }
    }
}
