//
//  Array+Migraine.swift
//  Migraine
//
//  Created by MZiO on 20/11/24.
//

import Foundation

extension Array where Element: Migraine {
    func filterByMonth(_ month: Int, year: Int) -> [Element] {
        self.filter { $0.date.month == month && $0.date.year == year }
    }
}
