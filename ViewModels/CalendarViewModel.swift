//
//  CalendarViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//

import SwiftUI
import Combine

class CalendarViewModel: ObservableObject {
    
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
    
}//class
