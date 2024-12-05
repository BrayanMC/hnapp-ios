//
//  ArticleDetailViewModel.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

class ArticleDetailViewModel: ObservableObject {
    
    @Published var url: String = ""
    
    var story: Story! {
        didSet {
            url = story.url
        }
    }
}
