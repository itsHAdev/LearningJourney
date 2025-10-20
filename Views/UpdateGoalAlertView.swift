//
//  UpdateGoalAlertView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 20/10/2025.
//

import SwiftUI

struct UpdateGoalAlertView: View {
    var body: some View {
        
        ZStack{
            
            Color.blackApp
                .frame(width: 300 , height: 184)
                .cornerRadius(35)
                .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.1, y: 0.1)
                .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.3, y: -0.3)
            
            VStack(alignment: .leading, spacing: 6){
                Text("Update Learning goal")
                    .font(.system(size: 17,weight:.semibold))
                
                Spacer().frame(height: 0)
                
                Text("If you update now, your streak")
                    .font(.system(size: 17))
                    .foregroundStyle(Color.white.opacity(0.7))
                
                Text("will start over.")
                    .font(.system(size: 17))
                    .foregroundStyle(Color.white.opacity(0.7))
                
                
               Spacer().frame(height: 6)
                
                HStack{
                    
                    Button{}label: {
                        ZStack{
                            
                            Color.gray.opacity(0.4)
                                .frame(width: 132,height: 48)
                                .cornerRadius(24)
                            
                            Text("Dismiss")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 17,weight: .medium))
                            
                        }//z1
                    }//b1
                    
                    Button{}label: {
                    ZStack{
                        
                        Color.orange
                            .frame(width: 132,height: 48)
                            .cornerRadius(24)
                        
                        Text("Update")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 17,weight: .medium))
                        
                  }//z1
                }//b1
              }//h
            }//v
        }//z
    }
}

#Preview {
    UpdateGoalAlertView()
}
