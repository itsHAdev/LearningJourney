//
//  ActivityView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 18/10/2025.
//
import SwiftUI

struct ActivityView: View {

    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    @State private var showingPicker = false
    @State private var weekOffset = 0
    @State private var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @State private var numb = ["20", "21", "22", "23", "24", "25", "26"]
    let months = Calendar.current.monthSymbols
    let years = Array(2000...2035)
    
    var body: some View {
        
        VStack{
            
            //topNav
            
            HStack{
                Text("Activity")
                    .font(.largeTitle)
                    .bold()
                
                Spacer().frame(width: 138)
                
                Button{} label: {
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
                }//bCalendar
                
                Button{} label:{
                    ZStack{
                        Color.black
                            .cornerRadius(1000)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.5, y: 0.5)
                            .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.5, y: -0.5)
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: "pencil.and.outline")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 17))
                    }//z
                }//bDrow
            }//h
            
            
            
            ZStack{
                Color.blackApp
                    .frame(width: 365 , height: 254)
                    .cornerRadius(13)
                    .shadow(color: Color.white.opacity(1), radius: 0.1, x: 0.1, y: 0.1)
                    .shadow(color: Color.white.opacity(1), radius: 0.1, x: -0.3, y: -0.3)
                
                VStack{
                    HStack{
                        // النص المتغير حسب الشهر والسنة
                        Text("\(months[selectedMonth - 1]) \(String(selectedYear))")


                            .font(.system(size: 17))
                        
                        // زر فتح Picker
                        Button {
                            showingPicker = true
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.orange)
                        }//b
                        
                        Spacer().frame(width: 150)
                        
                        Button {
                            if weekOffset > 0 {
                                weekOffset -= 1
                                updateNumbersForWeek()
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color.orange)
                        }//b
                        
                        Spacer().frame(width: 27)
                        
                        Button {
                            let totalDays = Calendar.current.range(of: .day, in: .month, for: DateComponents(calendar: Calendar.current, year: selectedYear, month: selectedMonth).date ?? Date())?.count ?? 30
                            if (weekOffset + 1) * 7 < totalDays {
                                weekOffset += 1
                                updateNumbersForWeek()
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.orange)
                        }//b
                    }//h
                        
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
                            }//v
                        }
                    }//h
                    
                    Color.gray
                        .frame(width: 329, height: 0.3)
                    
                    Spacer().frame(height: 12)
                    
                    Text("Learning Swift")
                        .offset(x:-107,y:0)
                        .font(.system(size: 16))
                        .bold()
                    
                    Spacer().frame(height: 12)
                    
                    
                    //streak
                    
                    HStack{
                        ZStack{
                            Color.orangeApp
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
                        }//zStreak
                        
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
                        }//zFreezdSt
                    }//h
                }//vAll
            }//blackBox
            
            Spacer().frame(height: 32)
            
            Button{} label: {
                ZStack{
                    Color.orangeApp
                        .frame(width: 274 , height: 274)
                        .glassEffect(.clear)
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
            
            Button{} label: {
                ZStack{
                    Color.cyanApp
                        .frame(width: 274 , height: 48)
                        .cornerRadius(1000)
                        .shadow(color: Color.white.opacity(1), radius: 1, x: 0.9, y: 0.9)
                        .shadow(color: Color.white.opacity(1), radius: 1, x: -0.5, y: -0.5)
                    
                    Text("Log as Freezed")
                        .frame(width: 274 , height: 48)
                        .foregroundStyle(Color.white)
                }//z
            }//bFreezd
            
            Spacer().frame(height: 12)
            
            Text("1 out of 2 Freezes used ")
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            
            
        }//Vmain
        
        
        // Picker ovirlay
        
        .overlay(
            Group {
                if showingPicker {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation { showingPicker = false }
                        }
                    
                    VStack(spacing: 20) {
                        Text("Select Month & Year")
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        HStack(spacing: 0) {
                            Picker("Month", selection: $selectedMonth) {
                                ForEach(1...12, id: \.self) { index in
                                    Text(months[index - 1]).tag(index)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 150)
                            
                            Picker("Year", selection: $selectedYear) {
                                ForEach(years, id: \.self) { year in
                                    Text(String(year))
                                        .tag(year)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 100)
                        }
                        .colorScheme(.dark)
                        
                        Button("Done") {
                            withAnimation {
                                showingPicker = false
                                updateNumbersForWeek() // لتحديث الأسبوع بعد اختيار الشهر
                            }
                        }
                        .font(.headline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 24)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding()
                    .frame(width: 320)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .transition(.scale.combined(with: .opacity))
                    .zIndex(1)
                }
            }
        )//overlay
        .animation(.easeInOut, value: showingPicker)
        
    }
    
    // تحديث أرقام الأسبوع الحالي
    func updateNumbersForWeek() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: selectedYear, month: selectedMonth)
        let startOfMonth = calendar.date(from: dateComponents) ?? Date()
        
        var newNumbers: [String] = []
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: weekOffset*7 + i, to: startOfMonth) {
                let dayNumber = calendar.component(.day, from: date)
                newNumbers.append(String(dayNumber))
            }
        }
        numb = newNumbers
    }
}

#Preview {
    ActivityView()
        .preferredColorScheme(.dark)
}
