//
//  ContentView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 16/10/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenStartView") private var hasSeenStartView = false
    @StateObject var activityVM = ActivityViewModel()
    var body: some View {
        
        if hasSeenStartView {
            ActivityView(activityVM: activityVM)
        } else {
            StartView(activityVM: activityVM)
        }
        
     }
    }


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

