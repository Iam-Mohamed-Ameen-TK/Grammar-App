//
//  ExperienceView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import SwiftUI

struct WritingAppsView: View {
    @StateObject private var viewModel = WritingAppsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            // Navigation Bar with Back Button and Progress Bar
            HStack(spacing: 12) {
                // Back Button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("back_icon") 
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }
                .frame(width: 44, height: 44)
                
                // Progress Bar
                ProgressBar(imageName: "progress_bar_2") // Update progress bar image name
            }
            .padding(.horizontal, 19)
            .padding(.top, -30)
            
            // Content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Question
                    Text(viewModel.question)
                        .font(.system(size: 32, weight: .bold))
                           .foregroundColor(.black)
                           .multilineTextAlignment(.leading)
                           .lineLimit(nil)
                           .fixedSize(horizontal: false, vertical: true)
                           .padding(.horizontal, 14)
                           .padding(.top, -8)
                    
                    // Options
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
            
            // Continue Button
            PrimaryButton(
                title: "Continue",
                action: viewModel.handleContinue
            )
            .disabled(true)
            .opacity(0.5)
            .padding(.horizontal, 4)
            .padding(.bottom, 4)
        }
        .navigationBarHidden(true)
    }
}

struct WritingAppsView_Previews: PreviewProvider {
    static var previews: some View {
        WritingAppsView()
    }
}
