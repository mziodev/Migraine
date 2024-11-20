//
//  WeekdayGridItem.swift
//  Migraine
//
//  Created by MZiO on 20/11/24.
//

import SwiftUI

struct WeekdayGridItem: View {
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
    WeekdayGridItem(calendarSymbol: "S")
}

#Preview("Number symbol") {
    WeekdayGridItem(calendarSymbol: "22")
}
