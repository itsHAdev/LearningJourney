//
//  ActivityView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.

import SwiftUI

struct ActivityView: View {
    @State private var showSecondView = false
    @AppStorage("userText") private var userText: String = ""
    @StateObject private var viewModel = ActivityViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            VStack{
                
                // MARK: - Navigation Bar
                
                HStack{
                    Text("Activity")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer().frame(width: 138)
                    
                    NavigationLink(destination: CalendarView())  {
                        ZStack{
                            Color.black
                                .cornerRadius(1000)
                                .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                                .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                                .frame(width: 44, height: 44)
                            
                            Image(systemName: "calendar")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 17))
                        }//z
                    }//navCalendar
            
                    NavigationLink(destination: ChangeLearningView()) {
                        ZStack {
                            Color.black
                                .cornerRadius(1000)
                                .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                                .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                                .frame(width: 44, height: 44)

                            Image(systemName: "pencil.and.outline")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 17))
                        }//z
                        
                    }//NavDrowButton

                }//h
                
                //MARK: - BlackBox
                
                ZStack{
                    Color.blackApp
                        .frame(width: 365 , height: 254)
                        .cornerRadius(13)
                        .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.1, y: 0.1)
                        .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.3, y: -0.3)
                    
                    VStack{
                
                //MARK: - Calendar
                
                        HStack{
        
                                Text("\(viewModel.currentMonthName) \(String(format: "%d", viewModel.selectedYear))") 
                                    .font(.system(size: 17))
                               
                            Button { viewModel.showingPicker = true } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.orange)
                            }//bالزر الي جنب الشهر
                            
                            Spacer().frame(width: 150)
                            
                            Button { viewModel.previousWeek() } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(Color.orange)
                            }//bleft
                            
                            Spacer().frame(width: 27)
                            
                            Button { viewModel.nextWeek() } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.orange)
                            }//bRight
                        }//h
                        
                        Spacer().frame(height: 12)
                        
                        HStack(spacing: 8) {
                            ForEach(Array(zip(viewModel.days.indices, viewModel.numbers)), id: \.0) { index, number in
                                VStack(spacing: 4) {
                                    
                                    // اسم اليوم
                                    Text(viewModel.days[index])
                                        .foregroundStyle(Color.gray)
                                        .font(.system(size: 13, weight: .semibold))
                                    
                                    // الرقم مع الدائرة فقط
                                    Text(number)
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 20))
                                        .frame(width: 44, height: 44)
                                        .background(
                                            ZStack {
                                                if viewModel.learnedDay == number {
                                                    Circle()
                                                        .foregroundStyle(Color.orange.opacity(0.4))
                                                } else if viewModel.freezedDay == number {
                                                    Circle()
                                                        .foregroundStyle(Color.cyan.opacity(0.4))
                                                }
                                            }//z
                                        )
                                }//v
                            }//forE
                            
                        }//hCalendar
                        
                        Spacer().frame(height: 6)
                        
                        Color.gray.frame(width: 329, height: 0.5)
                        
                        Spacer().frame(height: 12)
                        
                        
                        //MARK: - Streak
                        
                        Text("Learning \(userText)")
                            .offset(x:-107)
                            .font(.system(size: 16))
                            .bold()
                        
                        Spacer().frame(height: 12)
                        
                        HStack{
                            ZStack{
                                Color.orangeApp.frame(width: 160,height: 69).cornerRadius(34).opacity(0.2)
                                HStack{
                                    Image(systemName: "flame.fill").foregroundStyle(Color.orange).font(.system(size: 20))
                                    VStack{
                                        Text(" \(viewModel.streakCount)")
                                            .offset(x:-30).font(.system(size: 24)).bold()
                                        
                                        Text("Days Learned")
                                            .font(.system(size: 12)).multilineTextAlignment(.leading)
                                    }//v
                                }//h
                            }//zorange
                            
                            ZStack{
                                Color.cyan.frame(width: 160,height: 69).cornerRadius(34).opacity(0.2)
                                HStack{
                                    Image(systemName: "cube.fill")
                                        .foregroundStyle(Color.cyan).font(.system(size: 20))
                                    VStack{
                                        Text(" \(viewModel.freezedCount)")
                                            .offset(x:-30).font(.system(size: 24)).bold()
                                        
                                        Text("Days Freezed")
                                            .font(.system(size: 12)).multilineTextAlignment(.leading)
                                    }//v
                                }//h
                            }//zCyan
                        }//hStreak
                    }//v
                }//zBlackBox
                
                Spacer().frame(height: 32)
            
                
                // MARK: - Learned Button
                Button {
                    let today = String(Calendar.current.component(.day, from: Date()))
                    viewModel.logAsLearned(currentDay: today)
                } label: {
                    ZStack {
                        if viewModel.hasLearnedToday {
                            
                            // المستخدم ضغط على التعلم
                            Color.blackOrange
                                .frame(width: 274, height: 274)
                                .cornerRadius(1000)
                                .shadow(color: Color.orange.opacity(1), radius: 1, x: 1.5, y: 1.5)
                                .shadow(color: Color.orange.opacity(1), radius: 1, x: -0.8, y: -2)

                            Text("Learned Today")
                                .foregroundStyle(Color.orange)
                                .frame(width: 232, height: 86)
                                .font(.system(size: 36))
                                .bold()

                        } else if viewModel.hasFreezedToday {
                            // المستخدم ضغط Freezed → زر التعلم يتحول إلى Day Freezed
                            Color.blackCyan
                                .frame(width: 274, height: 274)
                                .cornerRadius(1000)
                                .shadow(color: Color.cyanApp.opacity(1), radius: 1, x: 1.5, y: 1.5)
                                .shadow(color: Color.cyanApp.opacity(1), radius: 1, x: -0.8, y: -2)

                            Text("Day Freezed")
                                .foregroundStyle(Color.cyan)
                                .frame(width: 200, height: 86)
                                .font(.system(size: 36))
                                .bold()
                                .multilineTextAlignment(.center)
                        } else {
                            // الحالة الطبيعية قبل الضغط
                            Color.orangeApp
                                .frame(width: 274, height: 274)
                                .cornerRadius(1000)
                                .shadow(color: Color.orange.opacity(1), radius: 1, x: 2.7, y: 2.7)
                                .shadow(color: Color.orange.opacity(1), radius: 1, x: -2.5, y: -2.5)

                            Text("Log as Learned")
                                .foregroundStyle(Color.white)
                                .frame(width: 232, height: 86)
                                .font(.system(size: 36))
                                .bold()
                        }
                    }
                }
                .disabled(viewModel.hasLearnedToday || viewModel.hasFreezedToday || viewModel.freezedCount >= 2)

                Spacer().frame(height: 32)

                // MARK: - Freezed Button
                Button {
                    let today = String(Calendar.current.component(.day, from: Date()))
                    viewModel.logAsFreezed(currentDay: today)
                } label: {
                    ZStack {
                        if viewModel.hasFreezedToday {
                            Color.darkCyan
                                .frame(width: 274, height: 48)
                                .cornerRadius(1000)
                                .shadow(color: Color.cyan.opacity(1), radius: 1, x: 0.2, y: 0.2)
                                .shadow(color: Color.cyan.opacity(1), radius: 1, x: -0.1, y: -0.1)

                            Text("Log as Freezed")
                                .foregroundStyle(Color.white)
                                .frame(width: 274, height: 48)
                        } else {
                            Color.cyanApp
                                .frame(width: 274, height: 48)
                                .cornerRadius(1000)
                                .shadow(color: Color.white.opacity(1), radius: 1, x: 0.9, y: 0.9)
                                .shadow(color: Color.white.opacity(1), radius: 1, x: -0.5, y: -0.5)

                            Text("Log as Freezed")
                                .foregroundStyle(Color.white)
                                .frame(width: 274, height: 48)
                        }
                    }
                }
                .disabled(viewModel.hasLearnedToday || viewModel.hasFreezedToday)

                Spacer().frame(height: 12)
                
                Text("\(viewModel.freezedCount) out of 2 Freezes used ")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.center)
                
            }//vMain
            .navigationBarBackButtonHidden(false)
        }//navS
        
        //MARK: - Overlay Picker
       
        .overlay(
            Group {
                if viewModel.showingPicker {
                    Color.black.opacity(0.4).ignoresSafeArea().onTapGesture {
                        withAnimation { viewModel.showingPicker = false }
                    }
                    
                    VStack(spacing: 20) {
                        Text("Select Month & Year").font(.headline).foregroundStyle(.white)
                        HStack(spacing: 0) {
                            Picker("Month", selection: $viewModel.selectedMonth) {
                                ForEach(1...12, id: \.self) { index in
                                    Text(viewModel.months[index - 1]).tag(index)
                                }
                            }.pickerStyle(.wheel).frame(width: 150)
                            
                            Picker("Year", selection: $viewModel.selectedYear) {
                                ForEach(viewModel.years, id: \.self) { year in
                                    Text(String(year)).tag(year)
                                }
                            }.pickerStyle(.wheel).frame(width: 100)
                        }.colorScheme(.dark)
                        
                        Button("Done") {
                            withAnimation {
                                viewModel.showingPicker = false
                                viewModel.updateNumbersForWeek()
                            }
                        }
                        .font(.headline).padding(.vertical, 8).padding(.horizontal, 24)
                        .background(Color.orange).foregroundColor(.white).cornerRadius(12)
                    }
                    .padding().frame(width: 320)
                    .background(.ultraThinMaterial).cornerRadius(20).shadow(radius: 10)
                    .transition(.scale.combined(with: .opacity)).zIndex(1)
                }
            }
        )//overlay
        
        .animation(.easeInOut, value: viewModel.showingPicker)
        
    }//body
}

#Preview {
    ActivityView()
        .preferredColorScheme(.dark)
}
