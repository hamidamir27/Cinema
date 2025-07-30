    //
    //  CinemaView.swift
    //  Cinema
    //
    //  Created by Felix Lush on 29/4/2024.
    //

import SwiftUI

struct CinemaView: View {
    
//    let cinemas : [String] = ["Ultimo", "Eastgardens", "Warringah Mall", "Sydney City"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State private var selectedCinemaIndex = 0
    @ObservedObject var cinemaViewController = CinemaViewController()
    @EnvironmentObject var ticketController : TicketViewController

var body: some View {
    NavigationView {
        VStack{
            ScrollSection(movies: movies, maxHeight: 300, maxWidth: 200, cinema: cinemaViewController.cinemas[0].name)
            VStack{
                Text("GoodFlix")
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Text("Welcome to Goodflix, select a cinema to see whats on!")
                    .frame(maxWidth: 280)
                    .foregroundColor(.white)
            }
                
                VStack{
                    Picker("Select Cinema", selection: $selectedCinemaIndex) {
                        ForEach(0..<cinemaViewController.cinemas.count, id: \.self) { index in
                            Text(self.cinemaViewController.cinemas[index].name)
                        }
                }
                    .background(.white)
                    .cornerRadius(10.0)
                    .padding()
                NavigationLink("Next", destination: MovieView(cinema: cinemaViewController.cinemas[selectedCinemaIndex]))
                .buttonStyle(.borderedProminent)
            }
            .navigationBarItems(trailing: NavigationLink(destination: TicketView(ticketController: ticketController)) {
                Image(systemName: "ticket.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .imageScale(.large)
                    .foregroundColor(.white)
            })
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
