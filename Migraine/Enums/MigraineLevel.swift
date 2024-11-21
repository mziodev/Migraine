//
//  MigraineLevel.swift
//  Migraine
//
//  Created by MZiO on 19/11/24.
//

import Foundation
import SwiftUI

enum MigraineLevel: Codable, CaseIterable {
    case mild
    case moderate
    case intense
    case extreme
    
    var number: Int {
        switch self {
        case .mild: 1
        case .moderate: 2
        case .intense: 3
        case .extreme: 4
        }
    }
    
    var name: String {
        switch self {
        case .mild: String(localized: "Mild")
        case .moderate: String(localized: "Moderate")
        case .intense: String(localized: "Intense")
        case .extreme: String(localized: "Extreme")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .mild: .mgPear
        case .moderate: .mgXanthous
        case .intense: .mgPumpkin
        case .extreme: .mgFolly
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .mild, .moderate: .black
        case .intense, .extreme: .white
        }
    }
}
