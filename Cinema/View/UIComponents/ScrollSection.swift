//
//  ScrollSection.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct ScrollSection: View {
    
    @State var title = ""
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
    @State var maxHeight : CGFloat = 180
    @State var maxWidth : CGFloat = 130
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20.0){
                    ForEach(movies, id: \.id){ movie in
                        NavigationLink (destination: BookingView(movie: movie)) {
                            Image(movie.image)
                                .resizable()
                                .frame(width: maxWidth, height: maxHeight)
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fill)
                        }
                        
                    }
                }
                .offset(x: 20)
                .padding(.trailing, 40)
                .padding(.top, 10)
                
            }
        }
    }
}

#Preview {
    ScrollSection()
}
