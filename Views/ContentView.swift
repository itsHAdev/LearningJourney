//
//  ContentView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 16/10/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenStartView") private var hasSeenStartView = false
    @StateObject var activityTracker = ActivityTracker()
    @StateObject var activityVM: ActivityViewModel
    
    init() {
        let tracker = ActivityTracker()
        _activityTracker = StateObject(wrappedValue: tracker)
        _activityVM = StateObject(wrappedValue: ActivityViewModel(activityTracker: tracker))
    }
    
    var body: some View {
        Group {
            if hasSeenStartView {
                ActivityView(activityVM: activityVM, activityTracker: activityTracker)
            } else {
                StartView(activityVM: activityVM, activityTracker: activityTracker, hasSeenStartView: $hasSeenStartView)
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

