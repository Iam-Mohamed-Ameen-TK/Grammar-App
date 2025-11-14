//
//  TypeViewMoel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import SwiftUI

class FileTypeViewModel: ObservableObject {
    @Published var selectedOption: FileTypeModel?

    let question = """
    Which types of
    files do you usually
    upload for writing
    or grammar check?
    """

    let options: [FileTypeModel] = [
        FileTypeModel(id: "img", emoji: "🖼️", title: "Images (JPG, PNG)"),
        FileTypeModel(id: "pdf", emoji: "📄", title: "PDFs"),
        FileTypeModel(id: "excel", emoji: "📊", title: "Excel or spreadsheets"),
        FileTypeModel(id: "other", emoji: "📝", title: "Others")
    ]

    var canContinue: Bool {
        selectedOption != nil
    }

    func selectOption(_ option: FileTypeModel) {
        selectedOption = option
    }

    func handleContinue() {
        guard canContinue else { return }
        print("Selected: \(selectedOption?.id ?? "")")
    }
}
