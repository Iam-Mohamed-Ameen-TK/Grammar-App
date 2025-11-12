//
//  ContentView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 12/11/25.
//

import SwiftUI

struct IntroView: View {
    @StateObject private var viewModel = IntroViewModel()
    
    var body: some View {
        VStack {
            Spacer(minLength: 100)
            
            // MARK: - Mock iPhone image
            Image("IntroMockup")
                .resizable()
                .scaledToFit()
                .frame(width: 220)
                .shadow(radius: 5)
                .padding(.bottom, 40)
            
            // MARK: - Title
            Text(viewModel.model.title)
                .font(.custom("SF Pro Rounded Ultralight", size: 38))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 24)
                .padding(.bottom, 60)
            
            Spacer()
            
            // MARK: - Primary button
            PrimaryButton(title: viewModel.model.buttonTitle) {
                viewModel.onGetStarted()
            }
            .padding(.bottom, 25)
            
            // MARK: - Footer
            HStack(spacing: 4) {
                Text(viewModel.model.footerText)
                    .font(.custom("SFRounded-Black", size: 15))
                    .foregroundColor(.gray)
                
                Button(action: {
                    viewModel.onSignIn()
                }) {
                    Text(viewModel.model.signInText)
                        .font(.custom(" SFRounded-Ultralight", size: 15))
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 50)
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    IntroView()
}
