//
//  ArticleDetailView.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import WebKit

struct ArticleDetailView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var viewModel = ArticleDetailViewModel()
    @State private var isLoading = false
    
    init(story: Article) {
        self.viewModel.story = story
    }
    
    var body: some View {
        VStack {
            CustomNavigationBar(title: "", showBackButton: true) {
                coordinator.pop()
            }
            ZStack {
                WebView(url: viewModel.story.url, isLoading: $isLoading)
                if isLoading {
                    VStack {
                        LoadingView(text: "")
                            .padding()
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ArticleDetailView(
        story: Article(
            title: "Why America's economy is soaring ahead of its rivals",
            url: "https://ourworldindata.org/data-insights/nearly-half-of-teenagers-globally-cannot-read-with-comprehension",
            author: "Cotterzz",
            createdAt: "2024-12-04T20:29:21Z"
        )
    ).environmentObject(Coordinator())
}
