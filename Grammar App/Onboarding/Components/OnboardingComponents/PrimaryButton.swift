//
//  PrimaryButton.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 12/11/25.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 47/255, green: 185/255, blue: 178/255), // #2FB9B2
                            Color(red: 30/255, green: 150/255, blue: 145/255)  // darker teal
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 4)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PrimaryButton(title: "Get Started", action: {})
}
