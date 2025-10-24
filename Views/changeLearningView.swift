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
    
            HStack {
                
                Spacer()
                
                    .navigationTitle("Learning Goal")
                           .navigationBarTitleDisplayMode(.inline)
                           .toolbar {
                               ToolbarItem(placement: .navigationBarTrailing) {
                                   // يظهر فقط إذا تم اختيار زر
                                   if viewModel.selectedButton != nil {
                                       Button {
                                           showAlert = true
                                       } label: {
                                           Image(systemName: "checkmark")
                                                .foregroundColor(.white)
                                       }
                                       .alert("If you update now, your streak will start over.", isPresented: $showAlert) {
                                           Button("Cancel", role: .cancel) { }
                                           Button("Confirm") {
                                               userText = viewModel.inputText
                                               hasSeenOnboarding = true
                                               showHome = true
                                           }
                                       }
                                      //.tint(Color.orange)//يخلي نص الاليرت برتقالي
                                   }
                               }
                           }
                           
                           .fullScreenCover(isPresented: $showHome) {
                               ActivityView()
                           }
                
            }//hCheekB+Alert
          
            //.padding(.bottom, 20)
            
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
                
            }//vTextField
            
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
                    }//b
                    
                }//forE
                
                Spacer()//يخليهم يسار
                
                    
                
            }//H3button
            
            Spacer()//يخليهم فوق
        
        }//vMain
        
        .padding()//يخلي في مسافه من اليسار في الكود كله 
        
    }//body
}

#Preview {
    ChangeLearningView()
        .preferredColorScheme(.dark)
}
