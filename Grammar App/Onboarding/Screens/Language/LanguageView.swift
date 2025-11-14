//
//  LanguageView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import SwiftUI

struct LanguageView: View {
    @StateObject private var viewModel = LanguageViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State private var goToSpeed = false

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

                ProgressBar(imageName: "progress_bar_7")
            }
            .padding(.horizontal, 20)
            .padding(.top, -20)

            
            // MARK: - Main Content
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

            
            // MARK: - Continue Button
            PrimaryButton(title: "Continue") {
                viewModel.handleContinue()
                goToSpeed = true
            }
            .disabled(!viewModel.canContinue)
            .opacity(viewModel.canContinue ? 1 : 0.5)
            .padding(.horizontal, 4)
            .padding(.bottom, 6)


            // MARK: - Navigation to SpeedView
            NavigationLink(destination: SpeedView(), isActive: $goToSpeed) {
                EmptyView()
            }
            .hidden()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LanguageView()
}
