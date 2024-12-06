//
//  ArticleListView.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

struct ArticleListView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = ArticleListViewModel(dataSource: .shared)
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            List {
                ForEach(viewModel.articles, id: \.id) { article in
                    ArticleCellView(article: article)
                        .onTapGesture {
                            coordinator.push(.articleDetail(article))
                        }
                }
                .onDelete(perform: onDelete)
            }
            .scrollIndicators(.hidden)
            .refreshable {
                viewModel.fetchArticles()
            }
            .overlay(alignment: .center, content: {
                Group {
                    if viewModel.articles.isEmpty {
                        Text("No hay artículos para mostrar ...")
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
            })
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .articleList:
                    ArticleListView()
                case .articleDetail(let story):
                    ArticleDetailView(story: story)
                }
            }
        }
        .onAppear {
            viewModel.fetchArticles()
        }
    }
    
    private func onDelete(at indexSet: IndexSet) {
        for index in indexSet {
            let article = viewModel.articles[index]
            viewModel.delete(article: article)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleListView()
            .environmentObject(Coordinator())
    }
}
