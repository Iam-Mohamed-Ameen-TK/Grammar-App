//
//  ImproveView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import SwiftUI

struct ImproveView: View {
    @StateObject private var viewModel = ImproveViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State private var goToLanguageView = false   // ← Navigation target

    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Top Bar
            HStack {
                Button(action: { dismiss() }) {
                    Image("back_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                }

                ProgressBar(imageName: "progress_bar_8")
            }
            .padding(.horizontal, 20)
            .padding(.top, -20)

            
            // MARK: - Content
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    
                    Text(viewModel.question)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                        .padding(.top, -6)
                    
                    VStack(spacing: 12) {
                        ForEach(viewModel.options) { option in
                            OptionBox(
                                emoji: option.emoji,
                                title: option.title,
                                isSelected: viewModel.selectedOption == option,
                                action: {
                                    viewModel.selectOption(option)
                                }
                            )
                        }
                    }
                }
                .padding(.horizontal, 24)
            }

            Spacer()

            
            // MARK: - Continue
            PrimaryButton(title: "Continue") {
                viewModel.handleContinue()
                goToLanguageView = true   // ← GO TO LanguageView
            }
            .disabled(!viewModel.canContinue)
            .opacity(viewModel.canContinue ? 1.0 : 0.5)
            .padding(.horizontal, 4)
            .padding(.bottom, 6)

            
            // MARK: - NavigationLink
            NavigationLink(destination: LanguageView(), isActive: $goToLanguageView) {
                EmptyView()
            }
            .hidden()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ImproveView()
}
