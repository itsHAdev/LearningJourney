//
//  changeLearningViewModel.swift
//  LearningJourney
//
//  Created by Hadeel Alansari on 23/10/2025.
//

import SwiftUI
import Combine

class changeLearningViewModel: ObservableObject {
    @Published var selectedButton: String? = nil
    @Published var inputText: String
    
    init(initialSelection: String? = nil, initialInput: String) {
            self.selectedButton = initialSelection
            self.inputText = initialInput
        }
}//class
