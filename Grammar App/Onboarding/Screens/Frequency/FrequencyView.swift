//
//  FrequencyView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import SwiftUI

struct FrequencyView: View {
    @StateObject private var viewModel = FrequencyViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 1) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
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

// MARK: - Preview
struct FrequencyView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyView()
    }
}
