//
//  SwiftUIView1.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 20/10/2025.
//

import SwiftUI

struct SwiftUIView1: View {
    @State private var date = Date.now
    var body: some View {
        
        VStack{
            
            LabeledContent("Date"){
                
                DatePicker("",selection: $date)
            }
            
            
        }//v
    }
}

#Preview {
    SwiftUIView1()
}
