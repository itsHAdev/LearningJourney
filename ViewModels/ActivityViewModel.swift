//
//  ActivityViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//
import SwiftUI
import Combine

class ActivityViewModel: ObservableObject {
    
    @AppStorage("PlanDuration") var selectedButton: String = "Week"
    @AppStorage("userText") private var userText: String = ""
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    // عدادات محفوظة دائمًا
    @AppStorage("streakCount") var streakCount: Int = 0
    @AppStorage("freezedCount") var freezedCount: Int = 0
    
    @Published var selectedMonth: Int
    @Published var selectedYear: Int
    @Published var showingPicker = false
    @Published var weekOffset = 0
    @Published var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @Published var numbers: [String] = []
    
    let months = Calendar.current.monthSymbols
    let years: [Int]
    
    // MARK: - Tracking status for today (تعتمد على ActivityTracker، وهذه متغيرة حسب اليوم)
    @Published var hasLearnedToday = false
    @Published var hasFreezedToday = false
    @Published var learnedDay: String? = nil
    @Published var freezedDay: String? = nil
    
    init() {
        let calendar = Calendar.current
        let today = Date()
        self.selectedMonth = calendar.component(.month, from: today)
        self.selectedYear = calendar.component(.year, from: today)
        self.years = Array(2000...2035)
        if let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) {
            let weekdayOfFirstDay = calendar.component(.weekday, from: startOfMonth)
            let dayOffset = weekdayOfFirstDay - 1
            let dayNumberOfMonth = calendar.component(.day, from: today)
            let gridIndexToday = dayNumberOfMonth + dayOffset - 1
            self.weekOffset = gridIndexToday / 7
        } else {
            self.weekOffset = 0
        }
        updateNumbersForWeek()
    }
    
    func updateNumbersForWeek() {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else {
            numbers = Array(repeating: "-", count: 7)
            return
        }
        
        let weekdayOfFirstDay = calendar.component(.weekday, from: startOfMonth)
        let dayOffset = weekdayOfFirstDay - 1
        let totalDaysInMonth = calendar.range(of: .day, in: .month, for: startOfMonth)?.count ?? 30
        let totalGridCells = totalDaysInMonth + dayOffset
        let maxOffset = max((totalGridCells - 1) / 7, 0)
        if weekOffset > maxOffset { weekOffset = maxOffset }
        if weekOffset < 0 { weekOffset = 0 }
        
        var newNumbers: [String] = []
        for i in 0..<7 {
            let displayIndex = weekOffset * 7 + i
            let dayOfMonth = displayIndex - dayOffset + 1
            if dayOfMonth >= 1 && dayOfMonth <= totalDaysInMonth {
                newNumbers.append(String(dayOfMonth))
            } else {
                newNumbers.append("-")
            }
        }
        DispatchQueue.main.async { self.numbers = newNumbers }
    }
    
    func previousWeek() { if weekOffset > 0 { weekOffset -= 1; updateNumbersForWeek() } }
    func nextWeek() {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else { return }
        let weekdayOfFirstDay = calendar.component(.weekday, from: startOfMonth)
        let dayOffset = weekdayOfFirstDay - 1
        let totalDaysInMonth = calendar.range(of: .day, in: .month, for: startOfMonth)?.count ?? 30
        let totalGridCells = totalDaysInMonth + dayOffset
        let maxOffset = max((totalGridCells - 1) / 7, 0)
        if weekOffset < maxOffset { weekOffset += 1; updateNumbersForWeek() }
    }
    
    var currentMonthName: String {
        let safeIndex = selectedMonth - 1
        guard safeIndex >= 0 && safeIndex < months.count else { return "شهر غير معروف" }
        return months[safeIndex]
    }
    
    func logAsLearned(currentDay: String) {
        if !hasLearnedToday && !hasFreezedToday {
            hasLearnedToday = true
            streakCount += 1 // محفوظ في AppStorage الآن
            learnedDay = currentDay
        }
    }
    
    func logAsFreezed(currentDay: String) {
        if !hasFreezedToday && !hasLearnedToday && freezedCount < maxFreezes {
            hasFreezedToday = true
            freezedCount += 1 // محفوظ في AppStorage الآن
            freezedDay = currentDay
        }
    }
    
    var maxFreezes: Int {
        switch selectedButton {
        case "Week": return 2
        case "Month": return 8
        case "Year": return 96
        default: return 2
        }
    }
}//class

