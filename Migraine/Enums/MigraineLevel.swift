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
    case severe
    case extreme
    
    var number: Int {
        switch self {
        case .mild: 1
        case .moderate: 2
        case .intense: 3
        case .severe: 4
        case .extreme: 5
        }
    }
    
    var name: String {
        switch self {
        case .mild: String(localized: "Mild")
        case .moderate: String(localized: "Moderate")
        case .severe: String(localized: "Severe")
        case .intense: String(localized: "Intense")
        case .extreme: String(localized: "Extreme")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .mild: .mgLemonLime
        case .moderate: .mgXanthous
        case .intense: .mgPumpkin
        case .severe: .mgScarlet
        case .extreme: .mgPhlox
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .mild, .moderate: .primary
        case .intense, .severe, .extreme: .white
        }
    }
}
