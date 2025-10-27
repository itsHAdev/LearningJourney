//
//  ActivityViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//
import SwiftUI
import Combine

class ActivityViewModel: ObservableObject {
    let activityTracker: ActivityTracker
    
    // MARK: - Buttouns
    @AppStorage("PlanDuration") var selectedButton: String = "Week" // نوع الخطة: أسبوع، شهر، سنة
    @Published var showingPicker = false
    
    // MARK: - Learned and Freezed tracker
    @AppStorage("streakCount") var streakCount: Int = 0
    @AppStorage("freezedCount") var freezedCount: Int = 0
    @Published var hasLearnedToday = false
    @Published var hasFreezedToday = false
    @Published var learnedDay: String? = nil
    @Published var freezedDay: String? = nil
    
    var maxFreezes: Int {
        switch selectedButton {
        case "Week": return 2
        case "Month": return 8
        case "Year": return 96
        default: return 2
        }
    }
    
    func logAsLearned(currentDay: String) {
        if !hasLearnedToday && !hasFreezedToday {
            hasLearnedToday = true
            streakCount += 1
            learnedDay = currentDay
        }
    }
    
    func logAsFreezed(currentDay: String) {
        if !hasFreezedToday && !hasLearnedToday && freezedCount < maxFreezes {
            hasFreezedToday = true
            freezedCount += 1
            freezedDay = currentDay
        }
    }
    
    // MARK: - Calendar
    @Published var selectedMonth: Int
    @Published var selectedYear: Int
    @Published var weekOffset = 0
    @Published var numbers: [String] = []
    @Published var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    let months = Calendar.current.monthSymbols
    let years: [Int]
    
    var currentMonthName: String {
        let safeIndex = selectedMonth - 1
        guard safeIndex >= 0 && safeIndex < months.count else { return "شهر غير معروف" }
        return months[safeIndex]
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
    
    func previousWeek() {
        if weekOffset > 0 {
            weekOffset -= 1
            updateNumbersForWeek()
        }
    }
    
    func nextWeek() {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else { return }
        let weekdayOfFirstDay = calendar.component(.weekday, from: startOfMonth)
        let dayOffset = weekdayOfFirstDay - 1
        let totalDaysInMonth = calendar.range(of: .day, in: .month, for: startOfMonth)?.count ?? 30
        let totalGridCells = totalDaysInMonth + dayOffset
        let maxOffset = max((totalGridCells - 1) / 7, 0)
        if weekOffset < maxOffset {
            weekOffset += 1
            updateNumbersForWeek()
        }
    }
    
    // MARK: - Date Maker
    // بناء تاريخ من يوم/شهر/سنة
    func dateFor(dayString: String, month: Int, year: Int) -> Date? {
        guard let day = Int(dayString) else { return nil }
        var comps = DateComponents()
        comps.year = year
        comps.month = month
        comps.day = day
        return Calendar.current.date(from: comps)
    }
    
    // تحديث حالة اليوم
    func syncTodayState() {
        let today = Date()
        let status = activityTracker.statusFor(date: today)
        hasLearnedToday = (status == .learned)
        hasFreezedToday = (status == .freezed)
        
        let todayDayNumber = String(Calendar.current.component(.day, from: today))
        learnedDay = hasLearnedToday ? todayDayNumber : nil
        freezedDay = hasFreezedToday ? todayDayNumber : nil
    }
    
    // MARK: - Prepare for correct day
    init(activityTracker: ActivityTracker) {
        self.activityTracker = activityTracker
        
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
            self.weekOffset = gridIndexToday / 7//يعرض الاسبوع الي اليوزر فيه
        } else {
            self.weekOffset = 0
        }
        updateNumbersForWeek()
        syncTodayState() // مزامنة حالة اليوم فور التهيئة
    }
    
} // class
