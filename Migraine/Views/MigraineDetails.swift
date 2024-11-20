//
//  MigraineDetails.swift
//  Migraine
//
//  Created by MZiO on 19/11/24.
//

import SwiftData
import SwiftUI

struct MigraineDetails: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var migraine: Migraine
    @State private var isMigraineSaved: Bool = false
    
    let isNew: Bool
    let originalMigraine = Migraine()
    
    private var migraineDetailsTitle: String {
        isNew ? "New migraine" : "Migraine details"
    }
    
    init(migraine: Migraine = Migraine(), isNew: Bool = false) {
        self.migraine = migraine
        self.isNew = isNew
        
        self.originalMigraine.copy(from: migraine)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Date") {
                    DatePicker(
                        "Migraine date",
                        selection: $migraine.date,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                }
                
                Section("Level") {
                    MigraineDetailsLevelSelector(migraine: $migraine)
                }
                
                Section("Notes") {
                    TextField(
                        "Write how you felt...",
                        text: $migraine.notes,
                        axis: .vertical
                    )
                    .padding()
                }
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle(migraineDetailsTitle)
            .onDisappear {
                if !isMigraineSaved {
                    migraine.copy(from: originalMigraine)
                }
            }
            .toolbar {
                if isNew {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: cancel)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: save)
                }
            }
        }
    }
    
    private func cancel() {
        dismiss()
    }
    
    private func save() {
        if isNew { modelContext.insert(migraine) }
        isMigraineSaved = true
        
        dismiss()
    }
}

#Preview("New Migraine") {
    MigraineDetails(isNew: true)
}

#Preview("Existing Migraine") {
    MigraineDetails(migraine: SampleData.shared.migraine)
}
