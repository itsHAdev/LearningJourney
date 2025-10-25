//
//  changeLearningView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.
//
//changeLearningViewModel

import SwiftUI
struct ChangeLearningView: View {

    @ObservedObject var activityVM: ActivityViewModel
    @StateObject private var viewModel: changeLearningViewModel
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding = false
    @AppStorage("userText") var userText: String = ""
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    init(activityVM: ActivityViewModel) {
        self._activityVM = ObservedObject(wrappedValue: activityVM)
        
        let currentUserName = UserDefaults.standard.string(forKey: "userText") ?? "Swift"
        
        self._viewModel = StateObject(wrappedValue: changeLearningViewModel(
            initialSelection: nil,
            initialInput: currentUserName
        ))
    }
    var body: some View {
        
        VStack {
            
            //MARK: - TextField
            
            VStack(alignment: .leading) {
                Text("I want to learn")
                    .font(.system(size: 22))
                
                TextField("Swift", text: $viewModel.inputText)
                    .frame(width: 393 , height: 48)
                    .background(Color.black.opacity(0.1))
                
                Spacer().frame(height: 23)
                
                    .overlay(
                        Color.gray.opacity(0.3)
                            .frame(width: 790 , height: 1.5)
                            .multilineTextAlignment(.center)
                        
                    )//overlay
                
                Spacer().frame(height: 12)
                
                Text("I want to learn it in a ")
                    .font(.system(size:22))
                
            } //VText
           
            //MARK: - 3Buttoun
            
            Spacer().frame(height: 17)
            
            HStack(spacing: 10) {
                ForEach(["Week","Month","Year"], id: \.self) { button in
                    Button {
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
                    }//b
                }//forE
                Spacer()//يخلي الازرار يسار
            }//h
            
            Spacer()//يخلي الكود فوق
            
        } // vMain
        .padding()//يخلي في مسافه يمين ويسار
        
        
        //MARK: - Alert
        
        .alert("If you update now, your streak will start over.", isPresented: $showAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Confirm") {
                if let newPlan = viewModel.selectedButton {
                    activityVM.selectedButton = newPlan
                    activityVM.streakCount = 0
                    activityVM.freezedCount = 0
                    userText = viewModel.inputText
                }
                dismiss()
            }
        }
        // إعدادات Navigation
        .navigationTitle("Learning Goal")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            //CheeckMark
            ToolbarItem(placement: .navigationBarTrailing) {
                if viewModel.selectedButton != nil {
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    }//b
                }
            }
        }//toolbar
        
        
        
    }//body
}
#Preview {
    ChangeLearningView(activityVM: ActivityViewModel())
        .preferredColorScheme(.dark)
}
