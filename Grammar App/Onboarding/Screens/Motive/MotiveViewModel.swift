//
//  MotiveViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class GoalBarriersViewModel: ObservableObject {
    @Published var selectedOption: GoalBarriersModel?

    let question = """
    What's stopping
    you from achieving
    your writing goal?
    """

    let options: [GoalBarriersModel] = [
        GoalBarriersModel(id: "time", emoji: "🕰️", title: "Not enough time to edit or improve"),
        GoalBarriersModel(id: "grammar", emoji: "😕", title: "Unsure how to fix grammar or tone"),
        GoalBarriersModel(id: "examples", emoji: "💡", title: "Need better examples or suggestions"),
        GoalBarriersModel(id: "confidence", emoji: "📚", title: "Lack of confidence in writing skills"),
        GoalBarriersModel(id: "focus", emoji: "⚡", title: "Hard to stay focused or consistent")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: GoalBarriersModel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected: \(selectedOption?.id ?? "")")
    }
}
