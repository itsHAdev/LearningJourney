//
//  ContentView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 16/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            VStack {
                
                ZStack{
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width:109,height: 109)
                        .shadow(color:Color.orange , radius: 2)
                        .blur(radius: 0.25)
                    
                    Image(systemName: "flame.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.orange)
                    
                }//Z
                
                
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
                    
                    Color.gray
                        .frame(width: 361 , height: 0.3)
                    
                    Spacer().frame(height: 24)
                    
                    Text("I want to learn it in a ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size:22))
                
                }//V
                
                Spacer().frame(height: 17)
                
                
                HStack{
                    
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 97 , height: 48)
                            .cornerRadius(1000)
                            .foregroundStyle(Color.orange)
                        
                        Button("Week") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .foregroundStyle(Color.white)
                        .frame(width: 97 , height: 48)
                        
                    }//Week
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 97 , height: 48)
                            .cornerRadius(1000)
                            .foregroundStyle(Color.gray)
                        
                        Button("Month") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .foregroundStyle(Color.white)
                        .frame(width: 97 , height: 48)
                        
                    }//month
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 97 , height: 48)
                            .cornerRadius(1000)
                            .foregroundStyle(Color.gray)
                        
                        Button("Year") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .foregroundStyle(Color.white)
                        .frame(width: 97 , height: 48)
                        
                    }//year
                    
                    Spacer()
                    
                }//H
                
                Spacer().frame(height: 223)
            
                ZStack{
                    
                    Rectangle()
                        .frame(width: 182 , height: 48)
                        .cornerRadius(1000)
                        .foregroundStyle(Color.orange)
                    
                    Button("Start learning") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: 182 , height: 48)
                    
                }//year
                
            }//V1
       
        
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
