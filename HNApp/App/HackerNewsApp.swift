//
//  HackerNewsApp.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import SwiftData

@main
struct HackerNewsApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ArticleModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @StateObject private var coordinator: Coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            ArticleListView()
                .environmentObject(coordinator)
                .modelContainer(sharedModelContainer)
        }
    }
}
