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
                
                Button{}label: {
                   
                    ZStack{
                        Color.black
                            .cornerRadius(1000)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                            .frame(width: 44, height: 44)
                          
                        
                        Image(systemName: "calendar")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 17))
                    }//zCalendar
                }//B
                
                Button{}label:{
                    
                    ZStack{
                        
                    Color.black
                            .cornerRadius(1000)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                            .frame(width: 44, height: 44)
                    
                    Image(systemName: "pencil.and.outline")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 17))
                }//zDrow
                }//B
            
        }//hTopView
            
            Color.black
                .frame(width: 365 , height: 254)
                .cornerRadius(13)
                .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.1, y: 0.1)
               .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.3, y: -0.3)
        
            
            Spacer().frame(height: 32)
            
            
            
            Button{}label: {
                ZStack{
                    Color.orangeApp
                        .frame(width: 274 , height: 274)
                        .cornerRadius(1000)
                        .shadow(color: Color.orange.opacity(1), radius: 1, x: 1, y: 2)
                        .shadow(color: Color.orange.opacity(1), radius: 1, x: -0.8, y: -0.8)
                    
                    Text("Log as Learned")
                        .foregroundStyle(Color.white)
                            .frame(width: 232 ,height: 86)
                            .font(.system(size: 36))
                            .bold()
                            .multilineTextAlignment(.center)
                }//z
            }//B
            
            Spacer().frame(height: 32)
            
            
            Button{
                
            }label: {
                ZStack{
//                    Color.cyanApp
//                        .shadow(color: Color.red.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
//                        .shadow(color: Color.red.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
//                        .frame(width: 274 , height: 48)
//                        .cornerRadius(1000)
//                        
                    Text("Log as Freezed")
                        .frame(width: 274 , height: 48)
                        .foregroundStyle(Color.white)
                }//Z
            }//B
            .buttonStyle(.glassProminent)
            
            .shadow(color: Color.red.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
            .shadow(color: Color.red.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
            //.frame(width: 274 , height: 48)
            //.cornerRadius(1000)
            
            
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
