//
//  HackerNewsApp.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    
    @StateObject private var coordinator: Coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            ArticleListView()
                .environmentObject(coordinator)
        }
    }
}
