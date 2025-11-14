//
//  ExperienceViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import Foundation
import Combine

class ExperienceViewModel: ObservableObject {
    @Published var selectedOption: ExperienceModel?
    
    let question = "Have you tried other writing improvement apps before?"
    
    let options: [ExperienceModel] = [
        ExperienceModel(id: "inconsistent", emoji: "📱", title: "Yes, but didn't get consistent results"),
        ExperienceModel(id: "tried_once", emoji: "⏸️", title: "Tried once, didn't stick"),
        ExperienceModel(id: "first", emoji: "✨", title: "No, iGrammar is my first")
    ]
    
    var canContinue: Bool {
        selectedOption != nil
    }
    
    func selectOption(_ option: ExperienceModel) {
        selectedOption = option
    }
    
    func handleContinue() {
        guard canContinue else { return }
        // Handle navigation or save data
        print("Selected option: \(selectedOption?.id ?? "")")
    }
}

