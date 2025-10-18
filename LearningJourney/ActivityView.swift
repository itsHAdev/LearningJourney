//
//  ActivityView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        
        VStack{
            
            HStack{
                
            Text("Activity")
                .font(.largeTitle)
                .bold()
            
                Spacer().frame(width: 138)
                
                ZStack{
                    
                    Color.gray
                        .frame(width: 44, height: 44)
                        .cornerRadius(1000)
                    
                    Image(systemName:"calendar")
                        .font(.system(size: 17))
                }//zCalendar
            
                ZStack{
                    
                    Color.gray
                        .frame(width: 44, height: 44)
                        .cornerRadius(1000)
                    
                    Image(systemName:"pencil.and.outline")
                        .font(.system(size: 17))
                }//zDrow
                
        }//hTopView
            
            Color.gray
                .frame(width: 365 , height: 254)
                .cornerRadius(13)
            
            Spacer().frame(height: 32)
            
            ZStack{
                
                Color.orange
                    .frame(width: 274 , height: 274)
                    .cornerRadius(1000)
                
                Button("Log as Learned") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundStyle(Color.white)
                    .frame(width: 232 ,height: 86)
                    .font(.system(size: 36))
                    .bold()
                    .multilineTextAlignment(.center)
                
            }//Z
            
            Spacer().frame(height: 32)
            
            ZStack{
                Color.blue
                    .frame(width: 274 , height: 48)
                    .cornerRadius(1000)
                
                Button("Log as Freezed") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: 274 , height: 48)
                .cornerRadius(1000)
                .foregroundStyle(Color.white)
                
            }//z
            
            Spacer().frame(height: 12)
            
            Text("1 out of 2 Freezes used ")
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            
        }//Vmain
    }
}

#Preview {
    ActivityView()
        .preferredColorScheme(.dark)
}
