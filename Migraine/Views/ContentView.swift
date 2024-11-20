//
//  ContentView.swift
//  Migraine
//
//  Created by MZiO on 14/11/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: \Migraine.date) var migranes: [Migraine]
    
    @State private var currentMonth = Calendar.current.month
    @State private var currentYear = Calendar.current.year
    @State private var showingAddMigrane: Bool = false
    
    private let gridColumns: [GridItem] = Array(
        repeating: GridItem(),
        count: 7
    )
    
    private let monthSymbols = Calendar.current.monthSymbols
    private let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
    private var currentMonthMigraines: [Migraine] {
        migranes.filterByMonth(currentMonth, year: currentYear)
    }
    
    private var contentViewTitle: String {
        monthSymbols[currentMonth - 1] + ", \(currentYear)"
    }
    
    private var daysBeforeCurrentMonth: [String] {
        Calendar.current
            .daysBeforeMonth(of: currentMonth, year: currentYear)
            .map { _ in "" }
    }
    private var daysInCurrentMonth: [String] {
        Calendar.current.daysInMonth(of: currentMonth, year: currentYear)
    }
    private var calendarSymbols: [String] {
        weekdaySymbols + daysBeforeCurrentMonth + daysInCurrentMonth
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                CalendarControlBar(
                    currentMonth: $currentMonth,
                    currentYear: $currentYear
                )
                
                LazyVGrid(columns: gridColumns, spacing: 30) {
                    ForEach(
                        calendarSymbols.indices,
                        id: \.self
                    ) { index in
                        let calendarSymbol = calendarSymbols[index]
                        
                        if weekdaySymbols.contains(calendarSymbol) {
                            WeekdayGridItem(calendarSymbol: calendarSymbol)
                        } else {
                            if let migraine = currentMonthMigraines.first(where: {
                                $0.date.dayString == calendarSymbol
                            }) {
                                NavigationLink {
                                    MigraineDetails(migraine: migraine)
                                } label: {
                                    MigraineGridItem(
                                        calendarSymbol: calendarSymbol,
                                        migraineLevel: migraine.level
                                    )
                                }
                            } else {
                                Text(calendarSymbol)
                            }
                        }
                    }
                }
                .frame(height: 320)
                
                Button(action: addMigraine) {
                    Label("Add Migraine", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .bold()
                }
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
