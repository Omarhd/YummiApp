//
//  YummiAppApp.swift
//  YummiApp
//
//  Created by Omar Abdulrahman on 04/12/2023.
//

import SwiftUI
import SwiftData

@main
struct YummiAppApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
