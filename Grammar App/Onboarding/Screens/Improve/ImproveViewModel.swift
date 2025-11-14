//
//  ImproveViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class ImproveViewModel: ObservableObject {
    @Published var selectedOption: ImproveModel?

    let question = """
    What do you want
    to analyze first?
    """

    let options: [ImproveModel] = [
        ImproveModel(id: "grammar", emoji: "📝", title: "Grammar correction"),
        ImproveModel(id: "tone", emoji: "🎨", title: "Tone and style"),
        ImproveModel(id: "paraphrase", emoji: "🔄", title: "Paraphrase"),
        ImproveModel(id: "plagiarism", emoji: "🛡️", title: "Plagiarism or quality check")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: ImproveModel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected option: \(selectedOption?.id ?? "")")
    }
}
