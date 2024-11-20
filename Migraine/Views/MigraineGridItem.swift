//
//  MigraineGridItem.swift
//  Migraine
//
//  Created by MZiO on 20/11/24.
//

import SwiftUI

struct MigraineGridItem: View {
    let calendarSymbol: String
    let migraineLevel: MigraineLevel
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 33, height: 33)
                .foregroundStyle(
                    migraineLevel.backgroundColor
                )
            
            Text(calendarSymbol)
                .foregroundStyle(
                    migraineLevel.foregroundColor
                )
        }
    }
}

#Preview {
    MigraineGridItem(
        calendarSymbol: "22",
        migraineLevel: SampleData.shared.migraine.level
    )
}
