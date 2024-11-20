//
//  Migraine.swift
//  Migraine
//
//  Created by MZiO on 19/11/24.
//

import Foundation
import SwiftData

@Model
class Migraine {
    var date: Date = Date.now
    var level: MigraineLevel = MigraineLevel.mild
    var notes: String = ""
    
    init(date: Date = .now, level: MigraineLevel = .mild, notes: String = "") {
        self.date = date
        self.level = level
        self.notes = notes
    }
    
    func copy(from migrane: Migraine) {
        self.date = migrane.date
        self.level = migrane.level
        self.notes = migrane.notes
    }
}
