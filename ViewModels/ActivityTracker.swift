// ActivityTracker.swift

import Foundation
import SwiftUI
import Combine

enum Status: Equatable {
    case none
    case learned
    case freezed
}

final class ActivityTracker: ObservableObject {
    // نخزن الحالة حسب اليوم (نطبع التاريخ إلى بداية اليوم لتوحيد المفتاح)
    @Published private var statusByDay: [Date: Status] = [:]
    
    private let calendar = Calendar.current
    
    private func dayStart(for date: Date) -> Date {
        calendar.startOfDay(for: date)
    }
    
    func statusFor(date: Date) -> Status {
        let key = dayStart(for: date)
        return statusByDay[key] ?? .none
    }
    
    func setStatus(_ status: Status, for date: Date) {
        let key = dayStart(for: date)
        if status == .none {
            statusByDay.removeValue(forKey: key)
        } else {
            statusByDay[key] = status
        }
    }
}
