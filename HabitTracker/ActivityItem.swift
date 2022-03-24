//
//  ActivityItem.swift
//  HabitTracker
//
//  Created by Garret Poole on 3/24/22.
//

import Foundation

struct ActivityItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
}
