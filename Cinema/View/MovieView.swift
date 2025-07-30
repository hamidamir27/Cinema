//
//  HomeView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct MovieView: View {
    
    @State var animateBool : Bool = true
    @State var cinema : Cinema
    @State private var searchText = ""
    @ObservedObject var viewController = MovieViewController()
    
    
    var body: some View {
        ZStack {
            CircleBackground(colourString: "Green")
                .blur(radius: animateBool ? 30: 100)
                .offset(x: animateBool ? -50 : -130, y: animateBool ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animateBool.toggle()
                    }
                }
            
            CircleBackground(colourString: "purple")
                .blur(radius: animateBool ? 30: 100)
                .offset(x: animateBool ? 100 : 130, y: animateBool ? 150 : 100)
            
            VStack(spacing: 0.0){
                VStack {
                    Text("Pick a Movie")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Text("Cinema: \(cinema.name)")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                
                SearchBar(searchText: $searchText)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ScrollSection(title: "New Releases", movies: viewController.getMovies(byCategory: "New Release", from: cinema), cinema: cinema.name) // Pass an array of movies from the cinema object to here
                        ScrollSection(title: "Vintage Movies", movies: viewController.getMovies(byCategory: "Vintage", from: cinema), cinema: cinema.name) // Pass an array of movies from the cinema object to here
                        ScrollSection(title: "Local Favourites", movies: viewController.getMovies(byCategory: "Most Popular", from: cinema), cinema: cinema.name) // Pass an array of movies from the cinema object to here
                    }
                    .padding(.bottom, 90)
                }
                
                
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background{
            LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    MovieView(cinema : Cinema(movies: [
        Movie(
            image: "kungfupanda",
            title: "Kung Fu Panda",
            subtitle: "A clumsy panda learns martial arts.",
            showTimes: ["2024-04-29": ["11:00 AM", "2:00 PM"], "2024-05-02": ["5:00 PM", "8:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "Godzilla",
            title: "Godzilla",
            subtitle: "A giant monster terrorizes a city.",
            showTimes: ["2024-04-30": ["3:00 PM", "6:00 PM"], "2024-05-03": ["1:00 PM", "4:00 PM"]],
            category: ["New Release", "Most Popular"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "civilwar",
            title: "Captain America: Civil War",
            subtitle: "Superheroes face off in an epic battle.",
            showTimes: ["2024-05-01": ["12:00 PM", "3:00 PM"], "2024-05-04": ["6:00 PM", "9:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "abigail",
            title: "Abigail",
            subtitle: "A young girl's journey in a magical city.",
            showTimes: ["2024-05-02": ["11:00 AM", "2:00 PM"], "2024-05-05": ["5:00 PM", "8:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "amywinehouse",
            title: "Amy",
            subtitle: "The life and times of Amy Winehouse.",
            showTimes: ["2024-05-03": ["10:00 AM", "1:00 PM"], "2024-05-06": ["4:00 PM", "7:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "monkeyman",
            title: "Monkey Man",
            subtitle: "A new hero rises from the streets of Mumbai.",
            showTimes: ["2024-05-04": ["3:00 PM", "6:00 PM"], "2024-05-07": ["12:00 PM", "3:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "theroundup",
            title: "The Roundup",
            subtitle: "A cop tracks down an international crime syndicate.",
            showTimes: ["2024-05-05": ["2:00 PM", "5:00 PM"], "2024-05-08": ["11:00 AM", "2:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "ghostbusters",
            title: "Ghostbusters",
            subtitle: "Ghost hunters tackle supernatural threats.",
            showTimes: ["2024-05-06": ["1:00 PM", "4:00 PM"], "2024-05-09": ["3:00 PM", "6:00 PM"]],
            category: ["New Release", "Most Popular"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "clueless",
            title: "Clueless",
            subtitle: "A 1995 American coming-of-age teen comedy film written and directed by Amy Heckerling",
            showTimes: ["2024-04-29": ["1:00 PM", "4:00 PM"], "2024-05-02": ["6:00 PM", "9:00 PM"]],
            category: ["Vintage"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "10things",
            title: "10 Things I Hate About You",
            subtitle: "As soon as Cameron, a newbie at Padua High School, finds Bianca, he falls in love with her. However, to date Bianca, he must first get her older sister Kate, a mean feminist, to date someone.",
            showTimes: ["2024-04-30": ["12:00 PM", "3:00 PM"], "2024-05-03": ["7:00 PM", "10:00 PM"]],
            category: ["Vintage", "Most Popular"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "ferrisbuellers",
            title: "Ferris Buellers Day Off",
            subtitle: "Ferris Bueller, a high school student, fakes sickness to stay at home and spends the rest of the day with his best friend and girlfriend. Meanwhile, his dean tries to spy on him.",
            showTimes: ["2024-05-01": ["2:00 PM", "5:00 PM"], "2024-05-04": ["12:00 PM", "3:00 PM"]],
            category: ["Vintage", "Most Popular"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "bluesbrothers",
            title: "The Blues Brothers",
            subtitle: "When they learn that their childhood orphanage is about to be torn down, brothers Jake and Elwood Blues set out to save it by reuniting their old R & B band for a fundraising performance.",
            showTimes: ["2024-05-02": ["1:00 PM", "4:00 PM"], "2024-05-05": ["7:00 PM", "10:00 PM"]],
            category: ["Vintage"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "fightclub",
            title: "Fight Club",
            subtitle: "Unhappy with his capitalistic lifestyle, a white-collared insomniac forms an underground fight club with Tyler, a careless soap salesman. Soon, their venture spirals down into something sinister.",
            showTimes: ["2024-05-03": ["11:00 AM", "2:00 PM"], "2024-05-06": ["5:00 PM", "8:00 PM"]],
            category: ["Vintage"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        ),
        Movie(
            image: "footloose",
            title: "Footloose",
            subtitle: "Ren, a teenager, gets a culture shock when he learns that rock music and dancing are banned in the small town that his family relocates to. Ren starts a movement to get the ban abolished.",
            showTimes: ["2024-05-04": ["10:00 AM", "1:00 PM"], "2024-05-07": ["4:00 PM", "7:00 PM"]],
            category: ["Vintage"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        )
    ], name: "Earlwood"))
}
