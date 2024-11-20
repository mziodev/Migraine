//
//  Calendar+MonthUtilities.swift
//  Migraine
//
//  Created by MZiO on 15/11/24.
//

import Foundation

extension Calendar {
    var month: Int {
        self.component(.month, from: .now)
    }
    
    var year: Int {
        self.component(.year, from: .now)
    }
    
    func daysInMonth(of month: Int, year: Int) -> [String] {
        let lastDay = try! Date.lastDay(of: month, year: year)

        return (1...lastDay.dayInt).map { String($0) }
    }
        
    func daysBeforeMonth(of month: Int, year: Int) -> [String] {
        let previousMonth = month == 1 ? 12 : month - 1
        let previousYear = month == 1 ? year - 1 : year
        
        
        let firstDay = try! Date.firstDay(of: month, year: year)
        let daysInPreviousMonth = Calendar.current.daysInMonth(
            of: previousMonth,
            year: previousYear
        )
        
        return daysInPreviousMonth.suffix(firstDay.weekday - 1)
    }
    
    func daysAfterMonth(of month: Int, year: Int) -> [String] {
        let nextMonth = month == 12 ? 1 : month + 1
        let nextYear = month == 12 ? year + 1 : year
        
        let lastDay = try! Date.lastDay(of: month, year: year)
        let daysInNextMonth = Calendar.current.daysInMonth(
            of: nextMonth,
            year: nextYear
        )
        
        return Array(daysInNextMonth.prefix(7 - lastDay.weekday))
    }
}
