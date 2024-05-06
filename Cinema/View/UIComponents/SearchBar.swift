//
//  SearchBar.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "maginifyingglass")
            
            TextField("Search", text: $searchText)
            
            Image(systemName: "mic.fill")
        }
            .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
            .font(.headline)
            .background(.ultraThinMaterial)
            .foregroundColor(.white.opacity(0.6))
            .cornerRadius(10.0)
    }
}

#Preview {
    SearchBar(searchText: .constant("Sample Search"))
}
