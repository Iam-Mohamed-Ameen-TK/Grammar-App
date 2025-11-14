//
//  LanguageViewmodel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class LanguageViewModel: ObservableObject {
    @Published var selectedOption: LanguageModel?

    let question = """
    Do you write in
    more than one
    language?
    """

    let options: [LanguageModel] = [
        LanguageModel(id: "often", emoji: "🌍", title: "Yes, often"),
        LanguageModel(id: "sometimes", emoji: "✍️", title: "Sometimes"),
        LanguageModel(id: "english", emoji: "🇬🇧", title: "No, just English")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: LanguageModel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected Language Option: \(selectedOption?.id ?? "")")
    }
}
