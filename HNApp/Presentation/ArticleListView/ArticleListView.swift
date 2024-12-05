//
//  ArticleListView.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

struct ArticleListView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = ArticleListViewModel()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            List {
                ForEach(viewModel.stories, id: \.id) { story in
                    ArticleCellView(story: story)
                        .onTapGesture {
                            coordinator.push(.articleDetail(story))
                        }
                }
                .onDelete(perform: onDelete)
            }
            .scrollIndicators(.hidden)
            .refreshable {
                Task {
                    await viewModel.fetchArticles()
                }
            }
            .overlay(alignment: .center, content: {
                Group {
                    if viewModel.stories.isEmpty {
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
            Task {
                await viewModel.fetchArticles()
            }
        }
    }
    
    private func onDelete(at indexSet: IndexSet) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleListView()
            .environmentObject(Coordinator())
    }
}
