//
//  CalendarView.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 21/10/2025.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject private var viewModel = CalendarViewModel()
    @ObservedObject var activityTracker: ActivityTracker
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(viewModel.months2025.indices, id: \.self) { index in
                    VStack(spacing: -30) {
                        CalendarMonthView(
                            monthName: viewModel.months2025[index].name,
                            year: 2025,
                            numberOfDays: viewModel.months2025[index].numberOfDays,
                            startDayIndex: viewModel.months2025[index].startDayIndex,
                            days: viewModel.days,
                            tracker: activityTracker,
                            monthIndex: index + 1
                        )
                        
                        if index != viewModel.months2025.count - 1 {
                            Spacer().frame(height: 4)
                            Divider()
                                .background(Color.gray.opacity(0.6))
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .padding()
        }//scrollV
        
        .navigationTitle("All activities")
        
    }//body
}

import SwiftUI

struct CalendarMonthView: View {
    let monthName: String
    let year: Int
    let numberOfDays: Int
    let startDayIndex: Int
    let days: [String]
    
    @ObservedObject var tracker: ActivityTracker
    let monthIndex: Int

    private func dateFor(day: Int, month: Int, year: Int) -> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return Calendar.current.date(from: components)
    }
    
    var body: some View {
        let daysArray: [Int?] = Array(repeating: nil, count: startDayIndex) + Array(1...numberOfDays)
        let columns = Array(repeating: GridItem(.flexible()), count: 7)
        
        ZStack {
            Color.black.opacity(0.9)
                .frame(height: 325)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Month name and year (بدون أي فواصل آلاف)
                HStack {
                    Text("\(monthName) \(String(year))")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer().frame(height: 8)
                
                // Weekday headers
                HStack(spacing: 23) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .semibold))
                    }
                }
                .padding(.horizontal, 12)
                
                Spacer().frame(height: 8)
                
                // Days grid
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(daysArray.indices, id: \.self) { index in
                        if let dayNumber = daysArray[index] {
                            
                            let dayDate = dateFor(day: dayNumber, month: monthIndex, year: year)!
                            let status = tracker.statusFor(date: dayDate)
                            
                            ZStack {
                                if status == .learned {
                                    Circle()
                                        .fill(Color.orange.opacity(0.7))
                                        .multilineTextAlignment(.center)
                                        .frame(width: 35, height: 35)
                                } else if status == .freezed {
                                    Circle()
                                        .fill(Color.cyanApp.opacity(0.7))
                                        .multilineTextAlignment(.center)
                                        .frame(width: 35, height: 35)
                                }
                                
                                Text("\(dayNumber)")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                            }
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
    CalendarView(activityTracker: ActivityTracker())
}
