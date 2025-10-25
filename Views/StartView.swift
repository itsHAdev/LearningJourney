//
//  StartView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 20/10/2025.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var activityVM: ActivityViewModel
    @StateObject private var viewModel = StartViewModel()
    @State private var showHome = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @AppStorage("userText") private var userText: String = ""
    
    var body: some View {
        
        VStack {
            
            //MARK: - Icon
            
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
                
                
                TextField("Swift", text: $viewModel.inputText)
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
            
            //MARK: - 3Button
            
            HStack(spacing: 10) {
                ForEach(["Week","Month","Year"], id: \.self) { button in
                    Button {
                        activityVM.selectedButton = button
                        viewModel.selectedButton = button
                    } label: {
                        Text(button)
                            .frame(width: 97, height: 48)
                            .background(viewModel.selectedButton == button ? Color.orangeApp : Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(1000)
                            .shadow(color: viewModel.selectedButton == button ? Color.orange.opacity(1) : Color.white.opacity(1),
                                    radius: 0.1,
                                    x: viewModel.selectedButton == button ? 0.9 : 0.5,
                                    y: viewModel.selectedButton == button ? 0.9 : 0.5)
                            .shadow(color: viewModel.selectedButton == button ? Color.orange.opacity(1) : Color.white.opacity(1),
                                    radius: 0.1,
                                    x: viewModel.selectedButton == button ? -0.9 : -0.5,
                                    y: viewModel.selectedButton == button ? -0.9 : -0.5)
                    }//B
                }//forEach
                
                Spacer()//يخليهم من اليسار
                
            }//h
            
            Spacer().frame(height: 223)
            
            //MARK: - StartButton
            
            Button {
                userText = viewModel.inputText
                hasSeenOnboarding = true
                showHome = true
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 182 , height: 48)
                        .cornerRadius(1000)
                        .foregroundStyle(Color.orangeApp)
                        .shadow(color: Color.orange.opacity(1), radius: 0.1, x: 1.3, y: 1.3)
                        .shadow(color: Color.orange.opacity(1), radius: 0.1, x: -0.9, y: -1.5)
                    
                    Text("Start learning")
                        .foregroundStyle(Color.white)
                }//z
            }//B
            .disabled(viewModel.selectedButton == nil)
            .fullScreenCover(isPresented: $showHome) {
                ActivityView(activityVM: activityVM)
            }
            
            
        }//vMain
        
        .padding()
        
    }//body
}


#Preview {
    StartView(activityVM: ActivityViewModel())
        .preferredColorScheme(.dark)
}

