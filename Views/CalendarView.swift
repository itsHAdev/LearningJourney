//
//  CalendarView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 21/10/2025.
//

//import SwiftUI
//
//struct CalendarView: View {
//    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
//    var body: some View {
//
//        ZStack{
//            Color.blackApp.opacity(0.9)
//                .frame(width: 354,height: 325)
//            
//            VStack{
//                HStack{
//                    Text("October 2025")
//                        .font(.system(size: 17).weight(.semibold))
//                    Spacer().frame(width: 235)
//                }//h
//                
//                Spacer().frame(height: 8)
//                
//                
//                HStack(spacing: 23) {
//                    ForEach(days, id: \.self) { day in
//                        VStack(spacing: 4) {
//                            Text(day)
//                                .foregroundStyle(Color.gray)
//                                .font(.system(size: 13, weight: .semibold))
//                        }
//                    }
//                }
//
//              
//            }//v
//        }//z
//        
//    }
//}
//
//#Preview {
//    CalendarView()
//}

//import SwiftUI
//
//struct CalendarView: View {
//    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
//    
//    // بيانات الشهر: عدد الأيام واليوم اللي يبدأ فيه الشهر (0=SUN)
//    let numberOfDays = 31
//    let startDayIndex = 3
//    
//    var body: some View {
//        // مصفوفة الأيام مع فراغات أول المصفوفة
//        let daysArray: [Int?] = Array(repeating: nil, count: startDayIndex) + Array(1...numberOfDays)
//        
//        ZStack {
//            
//            Color.black.opacity(0.9)
//                .frame(width: 354, height: 325)
//                .cornerRadius(15)
//            
//            VStack {
//                // عنوان الشهر والسنة
//                HStack {
//                    Text("October 2025")
//                        .font(.system(size: 17, weight: .semibold))
//                    Spacer()
//                }
//                .padding(.horizontal)
//                
//                Spacer().frame(height: 8)
//                
//                // أيام الأسبوع
//                HStack(spacing: 23) {
//                    ForEach(days, id: \.self) { day in
//                        Text(day)
//                            .foregroundColor(.gray)
//                            .font(.system(size: 13, weight: .semibold))
//                    }
//                }
//                
//                Spacer().frame(height: 8)
//                
//                // أرقام الأيام
//                let columns = Array(repeating: GridItem(.flexible()), count: 7)
//                LazyVGrid(columns: columns, spacing: 10) {
//                    ForEach(daysArray.indices, id: \.self) { index in
//                        if let dayNumber = daysArray[index] {
//                            Text("\(dayNumber)")
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity)
//                        } else {
//                            Text("") // فراغ للأيام قبل بداية الشهر
//                                .frame(maxWidth: .infinity)
//                        }
//                    }
//                }
//                .padding(.horizontal)
//                
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview {
//    CalendarView()
//}

import SwiftUI

struct CalendarView: View {
    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    let months2025: [(name: String, numberOfDays: Int, startDayIndex: Int)] = [
        ("January", 31, 3),
        ("February", 28, 6),
        ("March", 31, 6),
        ("April", 30, 2),
        ("May", 31, 4),
        ("June", 30, 0),
        ("July", 31, 2),
        ("August", 31, 5),
        ("September", 30, 1),
        ("October", 31, 3),
        ("November", 30, 6),
        ("December", 31, 1)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(months2025.indices, id: \.self) { index in
                    VStack(spacing: -30) {
                        CalendarMonthView(
                            monthName: months2025[index].name,
                            year: 2025,
                            numberOfDays: months2025[index].numberOfDays,
                            startDayIndex: months2025[index].startDayIndex,
                            days: days
                        )
                        
                        // Divider مع مسافة صغيرة جدًا بين الأرقام والخط
                        if index != months2025.count - 1 {
                            Spacer().frame(height: 4) // صغيرة جدًا
                            Divider()
                                .background(Color.gray.opacity(0.6))
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct CalendarMonthView: View {
    let monthName: String
    let year: Int
    let numberOfDays: Int
    let startDayIndex: Int
    let days: [String]
    
    var body: some View {
        let daysArray: [Int?] = Array(repeating: nil, count: startDayIndex) + Array(1...numberOfDays)
        let columns = Array(repeating: GridItem(.flexible()), count: 7)
        
        ZStack {
            Color.black.opacity(0.9)
                .frame(height: 325)
                .cornerRadius(15)
            
            VStack {
                // اسم الشهر مع مسافة كبيرة (24) من أعلى المربع
                HStack {
                    Text("\(monthName) \(year)")
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 24)
                
                Spacer().frame(height: 8)
                
                // أيام الأسبوع
                HStack(spacing: 23) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .semibold))
                    }
                }
                
                Spacer().frame(height: 8)
                
                // أرقام الشهر
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(daysArray.indices, id: \.self) { index in
                        if let dayNumber = daysArray[index] {
                            Text("\(dayNumber)")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                        } else {
                            Text("")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CalendarView()
}
