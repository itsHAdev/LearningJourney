// ActivityTracker.swift

import SwiftUI
import Combine

// MARK: - Activity Tracker لتخزين حالة كل يوم
enum Status: String, Codable, Equatable {
    case none
    case learned
    case freezed
}

final class ActivityTracker: ObservableObject {
    @Published private(set) var statusByDay: [Date: Status] = [:] {
        didSet { saveData() }
    }

    private let calendar = Calendar.current
    private let saveKey = "statusByDayStorage"

    init() { loadData() }

    private func dayStart(for date: Date) -> Date {
        calendar.startOfDay(for: date)
    }

    func statusFor(date: Date) -> Status {
        statusByDay[dayStart(for: date)] ?? .none
    }

    func setStatus(_ status: Status, for date: Date) {
        let key = dayStart(for: date)
        if status == .none { statusByDay.removeValue(forKey: key) }
        else { statusByDay[key] = status }
    }

    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(statusByDay.mapKeys { $0.timeIntervalSince1970 }) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func loadData() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else { return }
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([TimeInterval: Status].self, from: data) {
            statusByDay = decoded.mapKeys { Date(timeIntervalSince1970: $0) }
        }
    }
}

extension Dictionary {
    func mapKeys<T>(_ transform: (Key) -> T) -> [T: Value] {
        var newDict: [T: Value] = [:]
        for (key, value) in self { newDict[transform(key)] = value }
        return newDict
    }
}
