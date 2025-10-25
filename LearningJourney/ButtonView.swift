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
            
            
            // MARK: - Will done
            
            Image(systemName: "hands.clap.fill")
                .foregroundStyle(Color.orange)
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 4)
            
            Text("Will done!")
                .frame(width: 338,height: 26)
                .font(.system(size: 22))
                .bold()
            
            Spacer().frame(height: 4)
            
            Text("Goal completed! start learning again or set new learning goal")
                .frame(width: 338,height: 56)
                .font(.system(size: 18))
                .foregroundStyle(Color.gray.opacity(0.6))
                .multilineTextAlignment(.center)
            
            
            // MARK: - blackOrange Learned Today
            
//            Button{}label: {
//                ZStack{
//                    Color.blackOrange
//                        .frame(width: 274 , height: 274)
//                        .cornerRadius(1000)
//                        .shadow(color: Color.orange.opacity(1), radius: 1, x: 1.5, y: 1.5)
//                        .shadow(color: Color.orange.opacity(1), radius: 1, x: -0.8, y: -2)
//                    
//                    Text("Learned Today")
//                        .foregroundStyle(Color.orange)
//                        .frame(width: 232 ,height: 86)
//                        .font(.system(size: 36))
//                        .bold()
//                        .multilineTextAlignment(.center)
//                }//z
//            }//B
            
            Spacer().frame(height: 32)
            // MARK: - blackCyan Freezed day
            
            Button{}label: {
                ZStack{
                    Color.blackCyan
                        .frame(width: 274 , height: 274)
                        .cornerRadius(1000)
                        .shadow(color: Color.cyanApp.opacity(1), radius: 1, x: 1.5, y: 1.5)
                        .shadow(color: Color.cyanApp.opacity(1), radius: 1, x: -0.8, y: -2)
                    
                    Text("Day Freezed")
                        .foregroundStyle(Color.cyan)
                        .frame(width: 200 ,height: 86)
                        .font(.system(size: 36))
                        .bold()
                        .multilineTextAlignment(.center)
                }//z
            }//B
            
            
            Spacer().frame(height: 32)
            
            // MARK: - Buttoun freedez
            
            Button{}label: {
                ZStack{
                    Color.darkCyan
                        .frame(width: 274 , height: 48)
                        .cornerRadius(1000)
                        .shadow(color: Color.cyan.opacity(1), radius: 1, x: 0.2, y: 0.2)
                        .shadow(color: Color.cyan.opacity(1), radius: 1, x: -0.1, y: -0.1)
                    
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
