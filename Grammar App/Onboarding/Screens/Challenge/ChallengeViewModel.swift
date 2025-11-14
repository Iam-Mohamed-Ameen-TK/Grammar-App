//
//  ChallengeViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var selectedOption: Challengemodel?

    let question = """
    What do you want
    to analyze first?
    """

    let options: [Challengemodel] = [
        Challengemodel(id: "grammar", emoji: "📝", title: "Grammar correction"),
        Challengemodel(id: "tone", emoji: "🎨", title: "Tone and style"),
        Challengemodel(id: "paraphrase", emoji: "🔄", title: "Paraphrase"),
        Challengemodel(id: "plagiarism", emoji: "🛡️", title: "Plagiarism or quality check")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: Challengemodel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected: \(selectedOption?.id ?? "")")
    }
}
