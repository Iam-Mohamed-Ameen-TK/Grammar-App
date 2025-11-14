//
//  MotiveViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class MotiveViewModel: ObservableObject {
    @Published var selectedOption: MotiveModel?

    let question = """
    What's stopping
    you from achieving
    your writing goal?
    """

    let options: [MotiveModel] = [
        MotiveModel(id: "time", emoji: "🕒", title: "Not enough time to edit or improve"),
        MotiveModel(id: "grammar", emoji: "😕", title: "Unsure how to fix grammar or tone"),
        MotiveModel(id: "examples", emoji: "💡", title: "Need better examples or suggestions"),
        MotiveModel(id: "confidence", emoji: "📚", title: "Lack of confidence in writing skills"),
        MotiveModel(id: "focus", emoji: "⚡", title: "Hard to stay focused or consistent")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: MotiveModel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected: \(selectedOption?.id ?? "")")
    }
}
