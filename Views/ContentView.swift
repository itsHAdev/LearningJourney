//
//  ContentView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 16/10/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenStartView") private var hasSeenStartView = false
    var body: some View {
        
        if hasSeenStartView {
            ActivityView()
        } else {
            StartView()   
        }
    
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
