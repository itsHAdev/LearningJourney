//
//  StartViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//

import SwiftUI
import Combine

class StartViewModel: ObservableObject {
    @Published var selectedButton: String? = nil
    @Published var inputText: String = ""
}//class
