//
//  Migraine+SampleData.swift
//  Migraine
//
//  Created by MZiO on 19/11/24.
//

import Foundation

extension Migraine {
    static let sampleData: [Migraine] = [
        Migraine(date: .now - 84600 * 15, level: .moderate),
        Migraine(date: .now - 84600 * 14, level: .intense),
        Migraine(date: .now - 84600 * 7, level: .severe),
        Migraine(date: .now - 84600 * 6, level: .extreme),
        Migraine(date: .now - 84600 * 2, level: .mild),
    ]
}
