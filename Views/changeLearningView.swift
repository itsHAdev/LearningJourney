//
//  changeLearningView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.
//
//
import SwiftUI

struct ChangeLearningView: View {
    
    @StateObject private var viewModel = changeLearningViewModel()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @AppStorage("userText") private var userText: String = ""
    @State private var showHome = false
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            // زر التشيك فوق يمين الصفحة
            HStack {
                Spacer()
                
                if viewModel.selectedButton != nil { // يظهر فقط بعد الاختيار
                    Button {
                        showAlert = true
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 44, height: 44)
                                .foregroundColor(Color.orangeApp)
                                .shadow(color: Color.orange.opacity(1), radius: 0.1, x: 1, y: 1)
                                .shadow(color: Color.orange.opacity(1), radius: 0.1, x: -1, y: -0.5)
                            Image(systemName: "checkmark")
                                .font(.system(size: 26))
                                .foregroundStyle(Color.white)
                        }
                    }
                    .alert("If you update now, your streak will start over.", isPresented: $showAlert) {
                        Button("Cancel", role: .cancel) { }
                        Button("Confirm") {
                            userText = viewModel.inputText
                            hasSeenOnboarding = true
                            showHome = true
                        }
                    }
                    .tint(Color.orange)
                    .fullScreenCover(isPresented: $showHome) {
                        ActivityView()
                    }
                }
            }
            .padding(.bottom, 20)
            
            VStack {
                Text("I want to learn")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22))
                
                TextField("Swift", text: $viewModel.inputText)
                    .padding()
                    .frame(width: 393, height: 48)
                
                Color.blackApp.frame(width: 361, height: 1.5)
                
                Spacer().frame(height: 24)
                
                Text("I want to learn it in a ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size:22))
            }
            
            Spacer().frame(height: 17)
            
            // أزرار Week, Month, Year
            HStack(spacing: 10) {
                ForEach(["Week", "Month", "Year"], id: \.self) { button in
                    Button {
                        viewModel.selectedButton = button
                    } label: {
                        Text(button)
                            .frame(width: 97, height: 48)
                            .background(viewModel.selectedButton == button ? Color.orangeApp : Color.blackApp)
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
                    }
                }
                Spacer()
            }
            
            Spacer()
        } // VStack
        .padding(.horizontal, 16)
    }
}

#Preview {
    ChangeLearningView()
        .preferredColorScheme(.dark)
}
