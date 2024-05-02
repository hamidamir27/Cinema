//
//  CircleBackground.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct CircleBackground: View {
    
    var colourString: String
    
    private func colourFromString(_ string: String) -> Color {
        switch string.lowercased() {
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        default:
            return .gray // default color if the string does not match
        }
    }
    
    var body: some View {
        Circle()
            .fill(colourFromString(colourString))
            .frame(width: 300, height: 300)
    }
}

#Preview {
    CircleBackground(colourString: "Green")
}
