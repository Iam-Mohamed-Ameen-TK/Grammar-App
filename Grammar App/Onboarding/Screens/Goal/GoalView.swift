//
//  GoalView.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

//import SwiftUI
//
//struct GoalView: View {
//    @StateObject private var viewModel = GoalViewModel()
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            
//            // HEADER (Back button + progress bar image)
//            HStack(spacing: 12) {
//                
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image("back_icon")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 60, height: 60)
//                }
//                .frame(width: 44, height: 44)
//                
//                Image("progress_bar_3")
//                    .resizable()
//                    .scaledToFit()
//            }
//            .padding(.horizontal, 19)
//            .padding(.top, 1)  // ✅ NEW: spacing from notch
//            // .padding(.top, UIApplication.safeAreaTop + 4) // (optional dynamic)
//            
//            
//            // MAIN CONTENT SCROLL
//            ScrollView {
//                VStack(alignment: .leading, spacing: 24) {
//                    
//                    Text("What’s your main\nwriting goal right\nnow?")
//                        .font(.system(size: 32, weight: .bold))
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(nil)
//                        .fixedSize(horizontal: false, vertical: true)
//                        .padding(.horizontal, 14)
//                        .padding(.top, -1)
//                    
//                    VStack(spacing: 12) {
//                        ForEach(viewModel.options) { option in
//                            OptionBox(
//                                emoji: option.emoji,
//                                title: option.title,
//                                isSelected: viewModel.selectedOption == option
//                            ) {
//                                viewModel.selectOption(option)
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal, 24)
//            }
//            
//            Spacer()
//            
//            PrimaryButton(
//                title: "Continue",
//                action: viewModel.handleContinue
//            )
//            .disabled(viewModel.selectedOption == nil)
//            .opacity(viewModel.selectedOption == nil ? 0.5 : 1)
//            .padding(.horizontal, 4)
//            .padding(.bottom, 4)
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//struct GoalView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalView()
//    }
//}

import SwiftUI

struct GoalView: View {
    @StateObject private var viewModel = GoalViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    // Navigation trigger
    @State private var goToSource = false
    
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
                
                Image("progress_bar_3")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.horizontal, 19)
            .padding(.top, 1)
            
            
            // MAIN CONTENT
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // GAP between progress bar and question
                    Spacer()
                        .frame(height: 1) // ✅ ADDED
                    
                    Text("What’s your main\nwriting goal right\nnow?")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 14)
                        .padding(.top, -1)
                    
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
            
            
            // 🔥 Hidden navigation link to SourceView
            NavigationLink(destination: SourceView(), isActive: $goToSource) {
                EmptyView()
            }
            .hidden()
            
            
            // PRIMARY BUTTON WITH NAVIGATION
            PrimaryButton(
                title: "Continue",
                action: {
                    if viewModel.selectedOption != nil {
                        goToSource = true  // 🚀 navigate to SourceView
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

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GoalView()
        }
    }
}
