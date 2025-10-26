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
    @StateObject var activityTracker = ActivityTracker() // Shared tracker for both views
    
    var body: some View {
        
        if hasSeenStartView {
            ActivityView(activityVM: activityVM, activityTracker: activityTracker)
        } else {
            StartView(activityVM: activityVM, activityTracker: activityTracker)
        }
        
     }
    }


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
