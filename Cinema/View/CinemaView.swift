//
//  CinemaView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct CinemaView: View {
    
    let cinemas : [String] = ["Ultimo", "Eastgardens", "Warringah Mall", "Sydney City"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State private var cinemaSelection : String = "Ultimo"
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollSection(maxHeight: 300, maxWidth: 200)
                VStack{
                    Text("GoodFlix")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    Text("Welcome to Goodflix, select a cinema to see whats on!")
                        .frame(maxWidth: 280)
                        .foregroundColor(.white)
                    
                    VStack{
                        Picker("Cinemas", selection: $cinemaSelection) {
                            ForEach(cinemas, id:\.self){
                                Text($0)
                            }
                        }
                        .background(.white)
                        .cornerRadius(10.0)
                        .padding()
                    }
                    NavigationLink("Next", destination: HomeView(cinema: cinemaSelection))
                        .buttonStyle(.borderedProminent)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background{
                LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
        }
        }
    }
}

#Preview {
    CinemaView()
}
