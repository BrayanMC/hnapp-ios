//
//  ArticleListViewModel.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

class ArticleListViewModel: ObservableObject {
    
    @Published var stories: [Story] = []
    
    func fetchArticles() async {
        let fetchedStories: [Story] = [
            Story(title: "Why America's economy is soaring ahead of its rivals", url: "https://ourworldindata.org/data-insights/nearly-half-of-teenagers-globally-cannot-read-with-comprehension", author: "Cotterzz", createdAt: "2024-12-04T20:29:21Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z"),
            Story(title: "Show HN: Eyed Out – Privacy-Focused Browser", url: "https://www.ft.com/content/1201f834-6407-4bb5-ac9d-18496ec2948b", author: "Suppafly", createdAt: "2024-12-04T20:13:17Z"),
            Story(title: "Christopher Hitchens and the Necessity of Universalism", url: "https://www.armaansahni.com/game/", author: "tokinonagare", createdAt: "2024-12-04T19:06:41Z")
        ]
        
        DispatchQueue.main.async {
            self.stories = fetchedStories
        }
    }
}
