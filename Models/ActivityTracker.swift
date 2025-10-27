// ActivityTracker.swift

import SwiftUI
import Combine

//MARK: - Status
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
    
    init() {
        loadData()
    }
    
    // MARK: - Date Helpers
    private func dayStart(for date: Date) -> Date {
        calendar.startOfDay(for: date)
    }
    
    // MARK: - Read Status
    /// استرجاع حالة يوم معين
    func statusFor(date: Date) -> Status {
        statusByDay[dayStart(for: date)] ?? .none
    }
    
    // MARK: - Update Status
    /// تحديث حالة يوم معين
    func setStatus(_ status: Status, for date: Date) {
        let key = dayStart(for: date)
        if status == .none {
            statusByDay.removeValue(forKey: key)
        } else {
            statusByDay[key] = status
        }
    }
    
    // MARK: - Reset All Data for ChangeLearningView
    func reset() {
        statusByDay.removeAll()
        UserDefaults.standard.removeObject(forKey: saveKey)
        objectWillChange.send()
    }
    
    // MARK: - Save Data
    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(statusByDay.mapKeys { $0.timeIntervalSince1970 }) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    // MARK: - Load Data
    private func loadData() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else { return }
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([TimeInterval: Status].self, from: data) {
            statusByDay = decoded.mapKeys { Date(timeIntervalSince1970: $0) }
        }
    }
}//class

// MARK: - Map key
extension Dictionary {
    func mapKeys<T>(_ transform: (Key) -> T) -> [T: Value] {
        var newDict: [T: Value] = [:]
        for (key, value) in self {
            newDict[transform(key)] = value
        }
        return newDict
    }
}
