//
//  Activities.swift
//  HabitTracker
//
//  Created by Garret Poole on 3/24/22.
//

import Foundation

class Activities: ObservableObject{
    @Published var items = [ActivityItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            //refer to array of ExpenseItem itself as a type
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
