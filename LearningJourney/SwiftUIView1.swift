//
//  SwiftUIView1.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 20/10/2025.
//

import SwiftUI

struct SwiftUIView1: View {
    var body: some View {
        
        ZStack{
            
            Color.orange
                .frame(width: 160,height: 69)
                .cornerRadius(34)
                .opacity(0.2)
            
            HStack{
                
                Image(systemName: "flame.fill")
                    .foregroundStyle(Color.orange)
                    .font(.system(size: 20))
                
                VStack{
                    Text("3")
                        .font(.system(size: 24))
                        .bold()
                    
                    Text("Days Learned")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                }//v
            }//h
        }//z
    }
}

#Preview {
    SwiftUIView1()
}
