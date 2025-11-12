//
//  OnboardingIntroViewModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 12/11/25.
//

import Foundation

final class IntroViewModel: ObservableObject {
    @Published var model = IntroModel()
    
    func onGetStarted() {
        // Handle navigation to next onboarding screen
        print("Get Started tapped")
    }
    
    func onSignIn() {
        // Handle navigation to Sign In screen
        print("Sign In tapped")
    }
}
