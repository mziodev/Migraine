//
//  SampleData.swift
//  Migraine
//
//  Created by MZiO on 19/11/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var modelContext: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Migraine.self,
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )

        do {
            modelContainer = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        Migraine.sampleData.forEach {
            modelContext.insert($0)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Sample data modelContext failed to save.")
        }
    }
    
    var migraine: Migraine {
        Migraine.sampleData[0]
    }
}
