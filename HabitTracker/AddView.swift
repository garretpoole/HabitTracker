//
//  AddView.swift
//  HabitTracker
//
//  Created by Garret Poole on 3/24/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar{
                Button("Save"){
                    if(title != ""){
                        let item = ActivityItem(title: title, description: description)
                        activities.items.append(item)
                    }
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
