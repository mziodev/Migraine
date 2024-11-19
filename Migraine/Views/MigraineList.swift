//
//  MigraineList.swift
//  Migraine
//
//  Created by MZiO on 19/11/24.
//

import SwiftData
import SwiftUI

struct MigraineList: View {
    @Query(sort: \Migraine.date) private var migraines: [Migraine]
    
    var body: some View {
        NavigationStack {
            List(migraines) { migraine in
                HStack {
                    Text(migraine.date.day.description)
                    
                    Spacer()
                    
                    Text(migraine.level.name)
                    
                    Circle()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(migraine.level.backgroundColor)
                }
            }
            .navigationTitle("Migraine list")
        }
    }
}

#Preview {
    MigraineList()
        .modelContainer(SampleData.shared.modelContainer)
}
