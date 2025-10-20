//
//  ButtonView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 20/10/2025.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        
        
        VStack{
            
            Button{}label: {
                ZStack{
                    Color.orangeApp
                        .frame(width: 274 , height: 274)
                        .cornerRadius(1000)
                        .shadow(color: Color.orange.opacity(1), radius: 1, x: 1.5, y: 1.5)
                        .shadow(color: Color.orange.opacity(1), radius: 1, x: -0.8, y: -2)
                    
                    Text("Log as Learned")
                        .foregroundStyle(Color.white)
                        .frame(width: 232 ,height: 86)
                        .font(.system(size: 36))
                        .bold()
                        .multilineTextAlignment(.center)
                }//z
            }//B
            
            Spacer().frame(height: 32)
            
            Button{}label: {
                ZStack{
                    Color.cyanApp
                        .frame(width: 274 , height: 48)
                        .cornerRadius(1000)
                        .shadow(color: Color.white.opacity(1), radius: 1, x: 0.9, y: 0.9)
                        .shadow(color: Color.white.opacity(1), radius: 1, x: -0.5, y: -0.5)
                    
                    Text("Log as Freezed")
                        .frame(width: 274 , height: 48)
                        .foregroundStyle(Color.white)
                }//Z
            }//B
            
            
            Spacer().frame(height: 12)
            
            Text("1 out of 2 Freezes used ")
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            
        }//vMain
    }
}

#Preview {
    ButtonView()
}
