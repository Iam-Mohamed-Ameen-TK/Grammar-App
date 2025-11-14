//
//  GoalViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation

final class GoalViewModel: ObservableObject {
    
    @Published var selectedOption: GoalOption? = nil
    
    @Published var options: [GoalOption] = [
        GoalOption(title: "Write clearly and confidently", emoji: "💬"),
        GoalOption(title: "Avoid grammar or tone mistakes", emoji: "✅"),
        GoalOption(title: "Sound professional and natural", emoji: "💼"),
        GoalOption(title: "Check for plagiarism or originality", emoji: "🔍"),
        GoalOption(title: "Write faster and smarter", emoji: "⚡️")
    ]
    
    let question = "What’s your main\nwriting goal right now?"
    
    
    func selectOption(_ option: GoalOption) {
        selectedOption = option
    }
    
    func handleContinue() {
        guard let choice = selectedOption else { return }
        print("Selected:", choice.title)
    }
}
