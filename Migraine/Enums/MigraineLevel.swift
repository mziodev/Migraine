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
    
    var name: String {
        switch self {
        case .mild: String(localized: "Mild")
        case .moderate: String(localized: "Moderate")
        case .intense: String(localized: "Intense")
        case .severe: String(localized: "Severe")
        case .extreme: String(localized: "Extreme")
        }
    }
    
    var color: Color {
        switch self {
        case .mild: .mgLemonLime
        case .moderate: .mgXanthous
        case .severe: .mgPumpkin
        case .intense: .mgScarlet
        case .extreme: .mgPhlox
        }
    }
}
