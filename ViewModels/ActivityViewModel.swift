//
//  ActivityViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//

import SwiftUI
import Combine

class ActivityViewModel: ObservableObject {
    @Published var selectedButton: String? = nil
    @AppStorage("userText") private var userText: String = ""
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    @Published var selectedMonth: Int
    @Published var selectedYear: Int
    @Published var showingPicker = false
    @Published var weekOffset = 0
    @Published var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @Published var numbers: [String] = []
    
    let months = Calendar.current.monthSymbols
    let years: [Int]
    
    init() {
        let calendar = Calendar.current
        self.selectedMonth = calendar.component(.month, from: Date())
        self.selectedYear = calendar.component(.year, from: Date())
        self.years = Array(2000...2035)
        updateNumbersForWeek()
    }
    
    // تحديث أرقام الأسبوع بطريقة آمنة
    func updateNumbersForWeek() {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else {
            numbers = Array(repeating: "-", count: 7)
            return
        }
        
        let totalDays = calendar.range(of: .day, in: .month, for: startOfMonth)?.count ?? 30
        let maxOffset = max((totalDays - 1) / 7, 0)
        if weekOffset > maxOffset { weekOffset = maxOffset }
        if weekOffset < 0 { weekOffset = 0 }
        
        var newNumbers: [String] = []
        for i in 0..<7 {
            if weekOffset * 7 + i < totalDays {
                let dayNumber = calendar.component(.day, from: calendar.date(byAdding: .day, value: weekOffset * 7 + i, to: startOfMonth)!)
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
        let maxOffset = max((totalDays - 1) / 7, 0)
        if weekOffset < maxOffset {
            weekOffset += 1
            updateNumbersForWeek()
        }
    }
    
    var currentMonthName: String {
        let safeIndex = selectedMonth - 1
        guard safeIndex >= 0 && safeIndex < months.count else {
            return "شهر غير معروف"
        }
        return months[safeIndex]
    }
    
    @Published var hasLearnedToday = false
    @Published var hasFreezedToday = false

    @Published var streakCount = 0         // الأيام المتعلمة
    @Published var freezedCount = 0        // الأيام المجمدة

    // دالة الضغط على زر التعلم (بدون تمرير يوم)
    func logAsLearned() {
        if !hasLearnedToday && !hasFreezedToday {
            hasLearnedToday = true
            streakCount += 1
        }
    }

    // دالة الضغط على زر Freezed (بدون تمرير يوم)
    func logAsFreezed() {
        if !hasFreezedToday && !hasLearnedToday {
            hasFreezedToday = true
            freezedCount += 1
        }
    }

    // (اختياري) إعادة التفعيل في اليوم الجديد
    func resetForNewDay() {
        hasLearnedToday = false
        hasFreezedToday = false
    }
  
    // ✅ نضيف متغيرين لتحديد اليوم اللي تعلم أو تجمد
    @Published var learnedDay: String? = nil
    @Published var freezedDay: String? = nil

    // FIX: rename to the correct spelling to match call sites
    func logAsLearned(currentDay: String) {
        if !hasLearnedToday && !hasFreezedToday {
            hasLearnedToday = true
            streakCount += 1
            learnedDay = currentDay
        }
    }

    func logAsFreezed(currentDay: String) {
        if !hasFreezedToday && !hasLearnedToday && freezedCount < 2 {
            hasFreezedToday = true
            freezedCount += 1
            freezedDay = currentDay
        }
    }
}
