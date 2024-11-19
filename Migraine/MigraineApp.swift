//
//  MigraineApp.swift
//  Migraine
//
//  Created by MZiO on 14/11/24.
//

import SwiftData
import SwiftUI

@main
struct MigraineApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Migraine.self,
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
