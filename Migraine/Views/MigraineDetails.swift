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
    
    let isNew: Bool
    
    private var viewTitle: String {
        isNew ? "New migraine" : "Migraine details"
    }
    
    init(migraine: Migraine = Migraine(), isNew: Bool = false) {
        self.migraine = migraine
        self.isNew = isNew
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
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 50)
                            .foregroundStyle(migraine.level.backgroundColor)
                            .overlay {
                                Text(migraine.level.name)
                                    .font(.headline.smallCaps())
                                    .foregroundStyle(
                                        migraine.level.foregroundColor
                                    )
                            }
                        
                        Picker("Migraine level", selection: $migraine.level) {
                            ForEach(MigraineLevel.allCases, id: \.self) { level in
                                Text(level.number.description)
                            }
                        }
                        .pickerStyle(.palette)
                    }
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
            .navigationTitle(viewTitle)
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
        let newMigraine = Migraine(
            date: migraine.date,
            level: migraine.level,
            notes: migraine.notes
        )
        
        modelContext.insert(newMigraine)
        dismiss()
    }
}

#Preview("New Migraine") {
    MigraineDetails(isNew: true)
}

#Preview("Existing Migraine") {
    MigraineDetails(migraine: SampleData.shared.migraine)
}
