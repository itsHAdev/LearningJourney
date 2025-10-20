//
//  ActivityView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.
//

import SwiftUI

struct ActivityView: View {
    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let numb = ["20", "21", "22", "23", "24", "25", "26"]
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
            
            ZStack{
               
                Color.blackApp
                    .frame(width: 365 , height: 254)
                    .cornerRadius(13)
                    .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.1, y: 0.1)
                    .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.3, y: -0.3)
                
                VStack{
                    
                    HStack{
                        Text("October 2025")
                            .font(.system(size: 17))
                    
                        
                        Button{}label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.orange)
                        }
                     
                        Spacer().frame(width: 150)
                        
                        Button{}label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color.orange)
                        }
                        
                        Spacer().frame(width: 27)
                        
                        Button{}label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.orange)
                        }
                       
                    }//hArowB
                    
                    Spacer().frame(height: 12)
                    
                    HStack(spacing: 20) {
                        ForEach(Array(zip(days, numb)), id: \.0) { day, number in
                            VStack(spacing: 4) {
                                Text(day)
                                    .foregroundStyle(Color.gray)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                Text(number)
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }//hDayNumb
                    Color.gray
                        .frame(width: 329, height: 0.5)
                    
                    Spacer().frame(height: 12)
                    
                    Text("Learning Swift")
                        .offset(x:-107,y:0)
                        .font(.system(size: 16))
                        .bold()
                    
                    Spacer().frame(height: 12)
                    
                    HStack{
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
                                        .offset(x:-30,y:0)
                                        .font(.system(size: 24))
                                        .bold()
                                    
                                    Text("Days Learned")
                                        .font(.system(size: 12))
                                        .multilineTextAlignment(.leading)
                                }//v
                            }//h
                        }//zStreak1
                        
                        ZStack{
                            
                            Color.cyan
                                .frame(width: 160,height: 69)
                                .cornerRadius(34)
                                .opacity(0.2)
                            
                            HStack{
                                
                                Image(systemName: "cube.fill")
                                    .foregroundStyle(Color.cyan)
                                    .font(.system(size: 20))
                                
                                VStack{
                                    Text("1")
                                        .offset(x:-30,y:0)
                                        .font(.system(size: 24))
                                        .bold()
                                    
                                    Text("Days Freezed")
                                        .font(.system(size: 12))
                                        .multilineTextAlignment(.leading)
                                }//v
                            }//h
                        }//zStreak2
                        
                    }//hStreks1+2
                   
                }//v
            }//zBlackBox
            
            
            
            Spacer().frame(height: 32)
            
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
            
            
            
//            .buttonStyle(.glassProminent)
//            
//            .shadow(color: Color.red.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
//            .shadow(color: Color.red.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
//            //.frame(width: 274 , height: 48)
//            //.cornerRadius(1000)
            
            
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
