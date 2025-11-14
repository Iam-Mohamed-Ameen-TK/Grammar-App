//
//  SourceView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import SwiftUI

struct SourceView: View {
    @StateObject private var viewModel = HearAboutUsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToType = false
    
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
                
                ProgressBar(imageName: "progress_bar_4")
                    .frame(height: 14)
            }
            .padding(.horizontal, 19)
            .padding(.top, 6)
            
            // MAIN CONTENT
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Spacer().frame(height: 10)
                    
                    Text("Where did you hear\nabout us?")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 14)
                    
                    VStack(spacing: 10) {
                        ForEach(viewModel.options) { option in
                            OptionBox(
                                emoji: option.imageName,
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
            
            NavigationLink(destination: TypeView(), isActive: $navigateToType) {
                EmptyView()
            }
            .hidden()
            
            PrimaryButton(
                title: "Continue",
                action: {
                    if viewModel.selectedOption != nil {
                        navigateToType = true
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

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView()
    }
}
