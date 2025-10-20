//
//  StartView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 20/10/2025.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            
            ZStack{
                
                Circle()
                    .fill(Color.black)
                    .frame(width:109,height: 109)
                    .shadow(color: Color.orange.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                    .shadow(color: Color.orange.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                    //.shadow(color:Color.orange , radius: 2)
                    .blur(radius: 0.25)

                Image(systemName: "flame.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.orange)
                
            }//Z icon
            
            
            Spacer().frame(height: 47)
        
            
            VStack(spacing: 4) {
                Text("Hello Learner")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 34))
                    .bold()
                    .foregroundStyle(Color.white)
                
                Text("This app will help you learn everyday!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 17))
                    .foregroundStyle(Color.gray)
            }//V
            
            Spacer().frame(height: 31)
            
            VStack{
                Text("I want to learn")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22))
                
                
                TextField("Swift", text: .constant(""))
                    .padding()
                    .frame(width: 393 , height: 48)
                
                Color.blackApp
                    .frame(width: 361 , height: 1.5)
                
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
            
            
            Spacer().frame(height: 223)
        
            
            
            Button{}label: {
                ZStack{
                    Rectangle()
                        .frame(width: 182 , height: 48)
                        .cornerRadius(1000)
                        .foregroundStyle(Color.orangeApp)
                        .shadow(color: Color.orange.opacity(1), radius: 0.1, x: 1.3, y: 1.3)
                        .shadow(color: Color.orange.opacity(1), radius: 0.1, x: -0.9, y: -1.5)
                    
                    Text("Start learning")
                        .foregroundStyle(Color.white)
                    
                }//z
            }//b
          
        }//V1
   
        .padding()
    }
}

#Preview {
    StartView()
    .preferredColorScheme(.dark)
}
