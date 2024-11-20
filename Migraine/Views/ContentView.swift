//
//  ContentView.swift
//  Migraine
//
//  Created by MZiO on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMonth = Calendar.current.month
    @State private var currentYear = Calendar.current.year
    
    @State private var showingAddMigrane: Bool = false
    
    private let gridColumns: [GridItem] = Array(
        repeating: GridItem(),
        count: 7
    )
    
    private let monthSymbols = Calendar.current.monthSymbols
    private let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
    
    private var viewTitle: String {
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
                HStack {
                    Button(action: decreaseMonth) {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Button(action: jumpToCurrentMonth) {
                        Image(systemName: "record.circle")
                    }
                    
                    Spacer()
                    
                    Button(action: increaseMonth) {
                        Image(systemName: "chevron.right")
                    }
                }
                .font(.headline)
                .padding()
                
                LazyVGrid(columns: gridColumns, spacing: 30) {
                    ForEach(
                        calendarSymbols.indices,
                        id: \.self
                    ) { index in
                        let calendarSymbol = calendarSymbols[index]
                        
                        if weekdaySymbols.contains(calendarSymbol) {
                            Text(calendarSymbol)
                                .font(.headline)
                                .foregroundStyle(
                                    calendarSymbol == "S" ? .secondary : .primary
                                )
                        } else {
                            Text(calendarSymbol)
                        }
                    }
                }
                .frame(height: 320)
                
                Button(action: addMigraine) {
                    Label("Add Migraine", systemImage: "plus.circle.fill")
                        .font(.title3)
                        .bold()
                }
            }
            .padding(.horizontal)
            .navigationTitle(viewTitle)
            .sheet(isPresented: $showingAddMigrane) {
                MigraineDetails(isNew: true)
            }
        }
    }
    
    private func decreaseMonth() {
        withAnimation {
            currentMonth = currentMonth == 1 ? 12 : currentMonth - 1
            currentYear = currentMonth == 12 ? currentYear - 1 : currentYear
        }
    }
    
    private func increaseMonth() {
        withAnimation {
            currentMonth = currentMonth == 12 ? 1 : currentMonth + 1
            currentYear = currentMonth == 1 ? currentYear + 1 : currentYear
        }
    }
    
    private func jumpToCurrentMonth() {
        withAnimation {
            currentMonth = Calendar.current.month
            currentYear = Calendar.current.year
        }
    }
    
    private func addMigraine() {
        showingAddMigrane = true
    }
}

#Preview {
    ContentView()
}
