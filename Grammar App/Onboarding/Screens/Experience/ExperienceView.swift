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
    
    // Navigation trigger
    @State private var goToGoal = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            // HEADER
            HStack(spacing: 12) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("back_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }
                .frame(width: 44, height: 44)
                
                ProgressBar(imageName: "progress_bar_2")
            }
            .padding(.horizontal, 19)
            .padding(.top, -30)
            
            
            // MAIN CONTENT
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
                    
                    
                    VStack(spacing: 12) {
                        ForEach(viewModel.options) { option in
                            OptionBox(
                                emoji: option.emoji,
                                title: option.title,
                                isSelected: viewModel.selectedOption == option
                            ) {
                                viewModel.selectOption(option)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            
            Spacer()
            
            
            // ⚡ NavigationLink + PrimaryButton
            NavigationLink(
                destination: GoalView(),
                isActive: $goToGoal
            ) {
                EmptyView()
            }
            .hidden()
            
            PrimaryButton(
                title: "Continue",
                action: {
                    if viewModel.selectedOption != nil {
                        goToGoal = true   // 🚀 Trigger navigation
                    }
                }
            )
            .disabled(viewModel.selectedOption == nil)
            .opacity(viewModel.selectedOption == nil ? 0.5 : 1)
            .padding(.horizontal, 4)
            .padding(.bottom, 4)
        }
        .navigationBarHidden(true)
    }
}

struct WritingAppsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WritingAppsView()
        }
    }
}
