//
//  ActivityViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//
import SwiftUI
import Combine

// MARK: - نموذج البيانات (ViewModel) المسؤول عن منطق صفحة النشاط (Activity)
class ActivityViewModel: ObservableObject {
    
    // MARK: - تخزين الإعدادات العامة باستخدام AppStorage (لحفظها حتى بعد إغلاق التطبيق)
    @AppStorage("PlanDuration") var selectedButton: String = "Week" // نوع الخطة (أسبوع، شهر، سنة)
    @AppStorage("userText") private var userText: String = "" // نص المستخدم المحفوظ
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false // لتحديد إذا شاهد المستخدم الشرح الأولي
    
    // MARK: - المتغيرات الملاحظة (Observable) لتحديث الواجهة بشكل مباشر عند التغيير
    @Published var selectedMonth: Int // الشهر الحالي المحدد
    @Published var selectedYear: Int // السنة الحالية المحددة
    @Published var showingPicker = false // للتحكم في ظهور نافذة اختيار التاريخ
    @Published var weekOffset = 0 // رقم الأسبوع داخل الشهر
    @Published var days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"] // أسماء أيام الأسبوع
    @Published var numbers: [String] = [] // أرقام الأيام في الأسبوع الحالي
    
    // MARK: - الثوابت الخاصة بالأشهر والسنوات
    let months = Calendar.current.monthSymbols // أسماء الأشهر
    let years: [Int] // قائمة السنوات من 2000 إلى 2035
    
    // MARK: - المُهيئ (initializer) لضبط القيم الابتدائية
    init() {
        let calendar = Calendar.current
        let today = Date()
        self.selectedMonth = calendar.component(.month, from: today)
        self.selectedYear = calendar.component(.year, from: today)
        self.years = Array(2000...2035)
        if let startOfMonth = calendar.date(from: DateComponents(year: self.selectedYear, month: self.selectedMonth, day: 1)) {
            let weekdayOfFirstDay = calendar.component(.weekday, from: startOfMonth)
            let dayOffset = weekdayOfFirstDay - 1
            let dayNumberOfMonth = calendar.component(.day, from: today)
            let gridIndexToday = dayNumberOfMonth + dayOffset - 1
            self.weekOffset = gridIndexToday / 7
        } else {
            self.weekOffset = 0
        }
        updateNumbersForWeek() // تحديث الأيام أول مرة
    }
    
    // MARK: - دالة لتحديث أرقام الأيام في الأسبوع الحالي
    func updateNumbersForWeek() {
        let calendar = Calendar.current
        
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else {
            numbers = Array(repeating: "-", count: 7)
            return
        }
        
        // تحديد عدد الخانات الفارغة قبل اليوم الأول من الشهر
        let weekdayOfFirstDay = calendar.component(.weekday, from: startOfMonth)
        let dayOffset = weekdayOfFirstDay - 1
        
        let totalDaysInMonth = calendar.range(of: .day, in: .month, for: startOfMonth)?.count ?? 30
        // حساب عدد الخلايا الإجمالي في شبكة التقويم (أيام الشهر + الفراغات الأولى)
        let totalGridCells = totalDaysInMonth + dayOffset
        let maxOffset = max((totalGridCells - 1) / 7, 0)
        
        if weekOffset > maxOffset { weekOffset = maxOffset }
        if weekOffset < 0 { weekOffset = 0 }
        
        var newNumbers: [String] = []
        
        for i in 0..<7 {
            let displayIndex = weekOffset * 7 + i
            
            // حساب رقم اليوم الفعلي في الشهر
            let dayOfMonth = displayIndex - dayOffset + 1
            
            if dayOfMonth >= 1 && dayOfMonth <= totalDaysInMonth {
                newNumbers.append(String(dayOfMonth))
            } else {
                newNumbers.append("-")
            }
        }
        
        DispatchQueue.main.async {
            self.numbers = newNumbers
        }
    }
    
    // MARK: - الانتقال إلى الأسبوع السابق
    func previousWeek() {
        if weekOffset > 0 {
            weekOffset -= 1
            updateNumbersForWeek()
        }
    }
    
    // MARK: - الانتقال إلى الأسبوع التالي
    func nextWeek() {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1)) else { return }
        
        // إعادة حساب الحد الأقصى للإزاحة باستخدام منطق الإزاحة الجديدة
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
    
    // MARK: - اسم الشهر الحالي (باللغة الافتراضية للنظام)
    var currentMonthName: String {
        let safeIndex = selectedMonth - 1
        guard safeIndex >= 0 && safeIndex < months.count else {
            return "شهر غير معروف"
        }
        return months[safeIndex]
    }
    
    // MARK: - حالة اليوم الحالي (هل تم التعلم أو التجميد اليوم)
    @Published var hasLearnedToday = false
    @Published var hasFreezedToday = false
    
    // MARK: - العدادات الخاصة بعدد الأيام المتعلمة والمجمدة
    @Published var streakCount = 0 // عدد الأيام التي تم فيها التعلم
    @Published var freezedCount = 0 // عدد الأيام التي تم فيها التجميد
    
    // MARK: - تسجيل اليوم كمتعَلَّم بدون تحديد يوم معين (قديم)
    func logAsLearned() {
        if !hasLearnedToday && !hasFreezedToday {
            hasLearnedToday = true
            streakCount += 1
        }
    }
    
    // MARK: - تسجيل اليوم كمجمّد بدون تحديد يوم معين (قديم)
    func logAsFreezed() {
        if !hasFreezedToday && !hasLearnedToday {
            hasFreezedToday = true
            freezedCount += 1
        }
    }
    
    // MARK: - إعادة التفعيل في اليوم الجديد (للبدء من جديد)
    func resetForNewDay() {
        hasLearnedToday = false
        hasFreezedToday = false
    }
    
    // MARK: - تحديد اليوم الذي تم التعلم أو التجميد فيه
    @Published var learnedDay: String? = nil
    @Published var freezedDay: String? = nil
    
    // MARK: - تسجيل يوم معين كمتعَلَّم
    func logAsLearned(currentDay: String) {
        if !hasLearnedToday && !hasFreezedToday {
            hasLearnedToday = true
            streakCount += 1
            learnedDay = currentDay
        }
    }
    
    // MARK: - الحد الأقصى لعدد الأيام التي يمكن تجميدها حسب نوع الخطة
    var maxFreezes: Int {
        switch selectedButton {
        case "Week":
            return 2 // محاولتان في الأسبوع
        case "Month":
            return 8 // 8 محاولات في الشهر
        case "Year":
            return 96 // 96 محاولة في السنة
        default:
            return 2 // القيمة الافتراضية
        }
    }
    
    // MARK: - تسجيل يوم معين كمجمّد مع مراعاة الحد الأقصى للتجميدات
    func logAsFreezed(currentDay: String) {
        if !hasFreezedToday && !hasLearnedToday && freezedCount < maxFreezes {
            hasFreezedToday = true
            freezedCount += 1
            freezedDay = currentDay
        }
    }
} //class
