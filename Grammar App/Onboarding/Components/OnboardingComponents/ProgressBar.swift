//
//  ProgressBar.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 13/11/25.
//

import SwiftUI

struct ProgressBar: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 100)
    }
}

// Preview for testing
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(imageName: "progress_bar_1")
            .padding()
    }
}
