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
            
            Spacer()
            
        }//vMain
    }
}

#Preview {
    changeLearningView()
        .preferredColorScheme(.dark)
}
