//
//  SourceViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class SourceViewModel: ObservableObject {
    
    @Published var selectedOption: SourceModel? = nil
    
    @Published var options: [SourceModel] = [
        SourceModel(id: 0, imageName: "friends",   title: "Friend or family"),
        SourceModel(id: 1, imageName: "appstore",  title: "App Store"),
        SourceModel(id: 2, imageName: "google",    title: "Google"),
        SourceModel(id: 3, imageName: "facebook",  title: "Facebook"),
        SourceModel(id: 4, imageName: "tiktok",    title: "TikTok"),
        SourceModel(id: 5, imageName: "instagram", title: "Instagram")
    ]
    
    func selectOption(_ option: SourceModel) {
        selectedOption = option
    }
}
