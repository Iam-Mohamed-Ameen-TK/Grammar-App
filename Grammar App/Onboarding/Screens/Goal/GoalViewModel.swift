//
//  GoalViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation

final class GoalViewModel: ObservableObject {
    
    @Published var selectedOption: GoalModel? = nil
    
    @Published var options: [GoalModel] = [
        GoalModel(title: "Write clearly and confidently", emoji: "💬"),
        GoalModel(title: "Avoid grammar or tone mistakes", emoji: "✅"),
        GoalModel(title: "Sound professional and natural", emoji: "💼"),
        GoalModel(title: "Check for plagiarism or originality", emoji: "🔍"),
        GoalModel(title: "Write faster and smarter", emoji: "⚡️")
    ]
    
    let question = "What’s your main\nwriting goal right now?"
    
    
    func selectOption(_ option: GoalModel) {
        selectedOption = option
    }
    
    func handleContinue() {
        guard let choice = selectedOption else { return }
        print("Selected:", choice.title)
    }
}
