//
//  FrequencyViewMidel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import Foundation
import SwiftUI

class FrequencyViewModel: ObservableObject {
    @Published var selectedOption: FrequencyModel?
    
    let question = """
    How often do you
    write important
    emails or
    messages daily?
    """
    
    let options: [FrequencyModel] = [
        FrequencyModel(id: "rare", emoji: "👀", title: "Rarely (1–2 times)"),
        FrequencyModel(id: "sometimes", emoji: "🌟", title: "Sometimes (3–5 times)"),
        FrequencyModel(id: "often", emoji: "💪", title: "Often (6–10 times)"),
        FrequencyModel(id: "all_day", emoji: "🧘", title: "All day long (10+ times)")
    ]
    
    var canContinue: Bool {
        selectedOption != nil
    }
    
    func selectOption(_ option: FrequencyModel) {
        selectedOption = option
    }
    
    func handleContinue() {
        guard canContinue else { return }
        // Handle navigation or save data
        print("Selected option: \(selectedOption?.id ?? "")")
    }
}

