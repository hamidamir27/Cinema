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
    let movies: [Movie] = [
        Movie(
            image: "kungfupanda",
            title: "Kung Fu Panda",
            subtitle: "A clumsy panda learns martial arts.",
            showTimes: ["2024-04-29": ["12:00 PM", "3:00 PM", "6:00 PM"]]
        ),
        Movie(
            image: "Godzilla",
            title: "Godzilla",
            subtitle: "A giant monster terrorizes a city.",
            showTimes: ["2024-04-30": ["1:00 PM", "4:00 PM", "7:00 PM"]]
        ),
        Movie(
            image: "civilwar",
            title: "Captain America: Civil War",
            subtitle: "Superheroes face off in an epic battle.",
            showTimes: ["2024-05-01": ["11:00 AM", "2:00 PM", "5:00 PM"]]
        ),
        Movie(
            image: "abigail",
            title: "Abigail",
            subtitle: "A young girl's journey in a magical city.",
            showTimes: ["2024-05-02": ["10:00 AM", "1:00 PM", "4:00 PM"]]
        ),
        Movie(
            image: "amywinehouse",
            title: "Amy",
            subtitle: "The life and times of Amy Winehouse.",
            showTimes: ["2024-05-03": ["12:00 PM", "3:00 PM", "6:00 PM"]]
        ),
        Movie(
            image: "monkeyman",
            title: "Monkey Man",
            subtitle: "A new hero rises from the streets of Mumbai.",
            showTimes: ["2024-05-04": ["1:00 PM", "4:00 PM", "7:00 PM"]]
        ),
        Movie(
            image: "theroundup",
            title: "The Roundup",
            subtitle: "A cop tracks down an international crime syndicate.",
            showTimes: ["2024-05-05": ["11:00 AM", "2:00 PM", "5:00 PM"]]
        ),
        Movie(
            image: "ghostbusters",
            title: "Ghostbusters",
            subtitle: "Ghost hunters tackle supernatural threats.",
            showTimes: ["2024-05-06": ["10:00 AM", "1:00 PM", "4:00 PM"]]
        )
    ]

var body: some View {
    NavigationView {
        VStack{
            ScrollSection(movies: movies, maxHeight: 300, maxWidth: 200)
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
                NavigationLink("Next", destination: MovieView(cinema: cinemaSelection))
                    .buttonStyle(.borderedProminent)
            }
            .navigationBarItems(trailing: NavigationLink(destination: TicketView()) {
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
