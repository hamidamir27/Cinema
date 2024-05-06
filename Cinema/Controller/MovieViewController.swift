//
//  MovieViewController.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

class MovieViewController : ObservableObject {
    
    @Published var searchText : String = ""
    
    @Published var newReleases : [Movie] = [
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
    @Published var vintageMovies : [Movie] = [
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
    @Published var mostPopular : [Movie] = [
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
    
    // Get each array from a JSON or just hardcode
    
    //Write some code which filters the movie depending on the searchString
    
    var filteredMovies: [Movie] {
        if searchText == "" {return movies}
        print("Filtering for: \(searchText)")
        let filtered = movies.filter { movie in
            movie.title.localizedCaseInsensitiveContains(searchText)
        }
        print("Filtered Movies: \(filtered.map { $0.title })")
        return filtered
    } // Move to controller?
    
    
    
    
}
