//
//  Date+MonthUtilities.swift
//  Migraine
//
//  Created by MZiO on 16/11/24.
//

import Foundation

extension Date {
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    /// Returns the first day of the month and year.
    ///
    /// - Parameters:
    ///   - month: The month (1-12).
    ///   - year: The year.
    ///
    /// - Throws:
    ///   - `DateError.invalidMonth` if the month is not in the range 1-12.
    ///   - `DateError.failedToCreateDate` if the date cannot be created.
    static func firstDay(of month: Int, year: Int) throws -> Date {
        guard (1...12).contains(month) else {
            throw DateError.invalidMonth
        }
        
        var utcCalendar = Calendar(identifier: .gregorian)
        utcCalendar.timeZone = TimeZone(identifier: "UTC")!
        
        let dateComponents = DateComponents(year: year, month: month, day: 1)
        
        guard let date = utcCalendar.date(from: dateComponents) else {
            throw DateError.failedToCreateDate
        }
        
        return date
    }
    
    /// Returns the last day of the month and year.
    ///
    /// - Parameters:
    ///   - month: The month (1-12).
    ///   - year: The year.
    ///
    /// - Throws:
    ///   - `DateError.invalidMonth` if the month is not in the range 1-12.
    ///   - `DateError.failedToCreateDate` if the date cannot be created.
    static func lastDay(of month: Int, year: Int) throws -> Date {
        do {
            let firstOfNextMonth = try firstDay(
                of: month == 12 ? 1 : month + 1,
                year: month == 12 ? year + 1 : year
            )
            
            let lastDay = Calendar.current.date(
                byAdding: .day,
                value: -1,
                to: firstOfNextMonth
            ) ?? .now
            
            return lastDay
        } catch let error as DateError {
            throw error
        }
    }
}
