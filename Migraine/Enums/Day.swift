//
//  Day.swift
//  Migraine
//
//  Created by MZiO on 14/11/24.
//

import Foundation

enum Day: CaseIterable {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
    
    var name: String {
        switch self {
        case .sunday:
            String(localized: "Sunday")
        case .monday:
            String(localized: "Monday")
        case .tuesday:
            String(localized: "Tuesday")
        case .wednesday:
            String(localized: "Wednesday")
        case .thursday:
            String(localized: "Thursday")
        case .friday:
            String(localized: "Friday")
        case .saturday:
            String(localized: "Saturday")
        }
    }
    
    var shortName: String {
        switch self {
        case .sunday:
            String(localized: "Sun")
        case .monday:
            String(localized: "Mon")
        case .tuesday:
            String(localized: "Tue")
        case .wednesday:
            String(localized: "Wed")
        case .thursday:
            String(localized: "Thu")
        case .friday:
            String(localized: "Fri")
        case .saturday:
            String(localized: "Sat")
        }
    }
    
    var firstLettername: String {
        switch self {
        case .sunday:
            String(localized: "S")
        case .monday:
            String(localized: "M")
        case .tuesday:
            String(localized: "T")
        case .wednesday:
            String(localized: "W")
        case .thursday:
            String(localized: "T")
        case .friday:
            String(localized: "F")
        case .saturday:
            String(localized: "S")
        }
    }
}
