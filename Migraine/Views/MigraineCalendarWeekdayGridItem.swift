//
//  MigraineCalendarWeekdayGridItem.swift
//  Migraine
//
//  Created by MZiO on 20/11/24.
//

import SwiftUI

struct MigraineCalendarWeekdayGridItem: View {
    let calendarSymbol: String
    
    var body: some View {
        Text(calendarSymbol)
            .font(.headline)
            .foregroundStyle(
                calendarSymbol == "S" ? .secondary : .primary
            )
    }
}

#Preview("Letter S symbol") {
    MigraineCalendarWeekdayGridItem(calendarSymbol: "S")
}

#Preview("Number symbol") {
    MigraineCalendarWeekdayGridItem(calendarSymbol: "22")
}
