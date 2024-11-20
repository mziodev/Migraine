//
//  CalendarControlBar.swift
//  Migraine
//
//  Created by MZiO on 20/11/24.
//

import SwiftUI

struct CalendarControlBar: View {
    @Binding var currentMonth: Int
    @Binding var currentYear: Int
    
    var body: some View {
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
}

#Preview {
    CalendarControlBar(currentMonth: .constant(10), currentYear: .constant(2024))
}
