//
//  CustomMenuBar.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct CustomMenuBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        HStack(spacing: 0.0){
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Image(tab.rawValue)
                    .renderingMode(.template)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(
            LinearGradient(colors: [.blue, .gray], startPoint: UnitPoint(x: 0.0 ,y: 1.0), endPoint: UnitPoint(x: 1.0,y: 1.0))
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    CustomMenuBar(currentTab: .constant(.home))
}
