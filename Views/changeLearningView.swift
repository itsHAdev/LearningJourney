//
//  changeLearningView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.
//

import SwiftUI

struct changeLearningView: View {
    var body: some View {
        
        VStack{
            
            VStack{
                Text("I want to learn")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22))
                
                
                TextField("Swift", text: .constant(""))
                    .padding()
                    .frame(width: 393 , height: 48)
                    .overlay(
                            Rectangle()
                                .frame(height: 1.5)
                                .foregroundStyle(Color.blackApp),
                            alignment: .bottom
                        )
                
                Spacer().frame(height: 24)
                
                Text("I want to learn it in a ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size:22))
                
            }//V
            
            Spacer().frame(height: 17)
            
            
            HStack{
                
                Button{}label: {
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 97 , height: 48)
                            .cornerRadius(1000)
                            .foregroundStyle(Color.orangeApp)
                            
                            .shadow(color: Color.orange.opacity(1), radius: 0.1, x: 0.9, y: 0.9)
                            .shadow(color: Color.orange.opacity(1), radius: 0.1, x: -0.9, y: -0.9)
                    
                        Text("Week")
                            .foregroundStyle(Color.white)
                            .frame(width: 97 , height: 48)
                    }//z
                }//bWeek
                
                Button{}label: {
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 97 , height: 48)
                            .cornerRadius(1000)
                            .foregroundStyle(Color.blackApp)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                    
                        Text("Month")
                            .foregroundStyle(Color.white)
                            .frame(width: 97 , height: 48)
                    }//z
                }//bMonth
                
                Button{}label: {
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 97 , height: 48)
                            .cornerRadius(1000)
                            .foregroundStyle(Color.blackApp)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                    
                        Text("Year")
                            .foregroundStyle(Color.white)
                            .frame(width: 97 , height: 48)
                    }//z
                }//bYear
        
                Spacer()//يخليهم من اليسار
                
            }//H
            
            Spacer()
            
               
        }//vMain
        
        .padding(.horizontal, 16)

    }
    
}

#Preview {
    changeLearningView()
        .preferredColorScheme(.dark)
}
