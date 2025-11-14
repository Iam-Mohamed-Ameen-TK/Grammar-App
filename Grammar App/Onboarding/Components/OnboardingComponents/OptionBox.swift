//
//  OptionBox.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import SwiftUI

struct OptionBox: View {
    let emoji: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(emoji)
                    .font(.system(size: 32))
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 1)
                Text(title)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? Color(hex: "E8F5F3") : Color(hex: "F5F5F5"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(
                        isSelected ? Color(hex: "5ECDB5") : Color.clear,
                        lineWidth: 2
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct OptionBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            OptionBox(
                emoji: "🍌",
                title: "Banana",
                isSelected: false,
                action: { print("Banana selected") }
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
