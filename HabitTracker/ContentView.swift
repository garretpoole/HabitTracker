//
//  ContentView.swift
//  HabitTracker
//
//  Created by Garret Poole on 3/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    
    @State private var addingActivity = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(activities.items) { item in
                    NavigationLink{
                        ActivityView(activity: item)
                    } label: {
                        VStack(alignment: .leading){
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                                .font(.footnote)
                                
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .toolbar {
                Button{
                    addingActivity = true
                } label: {
                    Image(systemName: "plus")
                    Text("New Habit")
                }
            }
            .sheet(isPresented: $addingActivity){
                AddView(activities: activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
