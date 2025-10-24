//
//  ActivityViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//
//
//import SwiftUI
//import Combine
//
//class ActivityViewModel: ObservableObject {
//    @Published var selectedButton: String? = nil
//    @AppStorage("userText") private var userText: String = ""
//    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
//    @Published var selectedMonth = Calendar.current.component(.month, from: Date())
//    @Published var selectedYear = Calendar.current.component(.year, from: Date())
//    @Published var showingPicker = false
//    @Published var weekOffset = 0
//    @Published var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
//    @Published var numbers = ["20", "21", "22", "23", "24", "25", "26"]
//    
//    let months = Calendar.current.monthSymbols
//    let years = Array(2000...2035)
//    
//    init() {
//        updateNumbersForWeek()
//    }
//    
//    func updateNumbersForWeek() {
//        let calendar = Calendar.current
//        let dateComponents = DateComponents(year: selectedYear, month: selectedMonth)
//        let startOfMonth = calendar.date(from: dateComponents) ?? Date()
//        
//        var newNumbers: [String] = []
//        for i in 0..<7 {
//            if let date = calendar.date(byAdding: .day, value: weekOffset * 7 + i, to: startOfMonth) {
//                let dayNumber = calendar.component(.day, from: date)
//                newNumbers.append(String(dayNumber))
//            }
//        }
//
//        DispatchQueue.main.async {
//            self.numbers = newNumbers
//        }
//
//
//    }
//
//    
//    func previousWeek() {
//        if weekOffset > 0 {
//            weekOffset -= 1
//            updateNumbersForWeek()
//        }
//    }
//    
//    func nextWeek() {
//        let calendar = Calendar.current
//        let totalDays = calendar.range(of: .day, in: .month, for: DateComponents(calendar: calendar, year: selectedYear, month: selectedMonth).date ?? Date())?.count ?? 30
//        if (weekOffset + 1) * 7 < totalDays {
//            weekOffset += 1
//            updateNumbersForWeek()
//        }
//    }
//}
import SwiftUI
import Combine

class ActivityViewModel: ObservableObject {
    @Published var selectedButton: String? = nil
    @AppStorage("userText") private var userText: String = ""
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    @Published var selectedMonth = Calendar.current.component(.month, from: Date())
    @Published var selectedYear = Calendar.current.component(.year, from: Date())
    @Published var showingPicker = false
    @Published var weekOffset = 0
    @Published var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @Published var numbers: [String] = []
    
    let months = Calendar.current.monthSymbols
    let years = Array(2000...2035)
    
    init() {
        updateNumbersForWeek()
    }
    
    func updateNumbersForWeek() {
        let calendar = Calendar.current
        // احصل على أول يوم في الشهر الحالي
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else {
            numbers = Array(repeating: "-", count: 7)
            return
        }
        
        var newNumbers: [String] = []
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: weekOffset * 7 + i, to: startOfMonth) {
                let dayNumber = calendar.component(.day, from: date)
                newNumbers.append(String(dayNumber))
            } else {
                newNumbers.append("-")
            }
        }
        
        DispatchQueue.main.async {
            self.numbers = newNumbers
        }
    }
    
    func previousWeek() {
        if weekOffset > 0 {
            weekOffset -= 1
            updateNumbersForWeek()
        }
    }
    
    func nextWeek() {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else { return }
        let totalDays = calendar.range(of: .day, in: .month, for: startOfMonth)?.count ?? 30
        if (weekOffset + 1) * 7 < totalDays {
            weekOffset += 1
            updateNumbersForWeek()
        }
    }
}
