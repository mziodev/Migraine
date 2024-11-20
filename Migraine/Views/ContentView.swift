//
//  ContentView.swift
//  Migraine
//
//  Created by MZiO on 14/11/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var currentMonth = Calendar.current.month
    @State private var currentYear = Calendar.current.year
    @State private var showingAddMigrane: Bool = false
    
    private let monthSymbols = Calendar.current.monthSymbols
    
    private var contentViewTitle: String {
        monthSymbols[currentMonth - 1] + ", \(currentYear)"
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                MigraineCalendarControlBar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                MigraineCalendar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                Button("Add Migraine", action: addMigraine)
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.accentColor)
                    .clipShape(.rect(cornerRadius: 12))
                    .foregroundStyle(.white)
                    .padding()
            }
            .padding(.horizontal)
            .navigationTitle(contentViewTitle)
            .sheet(isPresented: $showingAddMigrane) {
                MigraineDetails(isNew: true)
            }
        }
    }
    
    private func addMigraine() {
        showingAddMigrane = true
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
