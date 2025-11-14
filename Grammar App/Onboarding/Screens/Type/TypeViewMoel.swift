//
//  TypeViewMoel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import SwiftUI

class TypeViewModel: ObservableObject {
    @Published var selectedOption: TypeModel?

    let question = """
    Which types of
    files do you usually
    upload for writing
    or grammar check?
    """

    let options: [TypeModel] = [
        TypeModel(id: "img", emoji: "🖼️", title: "Images (JPG, PNG)"),
        TypeModel(id: "pdf", emoji: "📄", title: "PDFs"),
        TypeModel(id: "excel", emoji: "📊", title: "Excel or spreadsheets"),
        TypeModel(id: "other", emoji: "📝", title: "Others")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: TypeModel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected: \(selectedOption?.id ?? "")")
    }
}
