//
//  MigraineCalendar.swift
//  Migraine
//
//  Created by MZiO on 20/11/24.
//

import SwiftData
import SwiftUI

struct MigraineCalendar: View {
    @Query(sort: \Migraine.date) var migraines: [Migraine]
    
    @Binding var currentMonth: Int
    @Binding var currentYear: Int
    
    private let gridColumns: [GridItem] = Array(
        repeating: GridItem(),
        count: 7
    )
    
    private let monthSymbols = Calendar.current.monthSymbols
    private let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
    
    private var currentMonthMigraines: [Migraine] {
        migraines.filterByMonth(currentMonth, year: currentYear)
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
        LazyVGrid(columns: gridColumns, spacing: 30) {
            ForEach(
                calendarSymbols.indices,
                id: \.self
            ) { index in
                let calendarSymbol = calendarSymbols[index]
                
                if weekdaySymbols.contains(calendarSymbol) {
                    MigraineCalendarWeekdayGridItem(calendarSymbol: calendarSymbol)
                } else {
                    if let migraine = currentMonthMigraines.first(where: {
                        $0.date.dayString == calendarSymbol
                    }) {
                        NavigationLink {
                            MigraineDetails(migraine: migraine)
                        } label: {
                            MigraineCalendarMigraineGridItem(
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
    }
}

#Preview {
    MigraineCalendar(currentMonth: .constant(11), currentYear: .constant(2024))
        .modelContainer(SampleData.shared.modelContainer)
}
