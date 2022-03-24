//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Garret Poole on 3/24/22.
//

import SwiftUI

struct ActivityView: View {
    
    let activity: ActivityItem
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text(activity.title)
                    .font(.title)
                Text(activity.description)
            }
        }
        
    }
}

struct ActivitiyView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: ActivityItem(title: "Hello", description: "World"))
    }
}
