//
//  ArticleDetailViewModel.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

class ArticleDetailViewModel: ObservableObject {
    
    @Published var url: String = ""
    
    var story: Article! {
        didSet {
            url = story.url
        }
    }
}
