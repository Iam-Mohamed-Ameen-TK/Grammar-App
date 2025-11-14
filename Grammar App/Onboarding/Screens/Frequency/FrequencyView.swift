//
//  FrequencyView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import SwiftUI

struct FrequencyView: View {
    @StateObject private var viewModel = FrequencyViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var navigateToWritingApps = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Top Bar
            HStack(spacing: 1) {
                Button(action: {
                    dismiss()
                }) {
                    Image("back_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }
                .frame(width: 44, height: 44)
                
                ProgressBar(imageName: "progress_bar_1")
            }
            .padding(.horizontal, 19)
            .padding(.top, -30)
            
            // MARK: - Main Content
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text(viewModel.question)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 14)
                        .padding(.top, -8)
                    
                    VStack(spacing: 8) {
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
            PrimaryButton(
                title: "Continue",
                action: {
                    viewModel.handleContinue()
                    navigateToWritingApps = true
                }
            )
            .disabled(!viewModel.canContinue)   
            .opacity(viewModel.canContinue ? 1.0 : 0.5)
            .padding(.horizontal, 4)
            .padding(.bottom, 4)
            
            // MARK: - NavigationLink (Hidden)
            NavigationLink(destination: WritingAppsView(), isActive: $navigateToWritingApps) {
                EmptyView()
            }
            .hidden()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FrequencyView()
}
