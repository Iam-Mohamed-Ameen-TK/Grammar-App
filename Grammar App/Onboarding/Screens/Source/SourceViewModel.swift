//
//  SourceViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation
import SwiftUI

class HearAboutUsViewModel: ObservableObject {
    
    @Published var selectedOption: HearAboutUsOption? = nil
    
    @Published var options: [HearAboutUsOption] = [
        HearAboutUsOption(id: 0, imageName: "friends",   title: "Friend or family"),
        HearAboutUsOption(id: 1, imageName: "appstore",  title: "App Store"),
        HearAboutUsOption(id: 2, imageName: "google",    title: "Google"),
        HearAboutUsOption(id: 3, imageName: "facebook",  title: "Facebook"),
        HearAboutUsOption(id: 4, imageName: "tiktok",    title: "TikTok"),
        HearAboutUsOption(id: 5, imageName: "instagram", title: "Instagram")
    ]
    
    func selectOption(_ option: HearAboutUsOption) {
        selectedOption = option
    }
}
