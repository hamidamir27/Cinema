//
//  MovieViewController.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

class MovieViewController: ObservableObject {
    
    @Published var searchText : String = ""
    
    
    
    var filteredMovies: [Movie] {
        if searchText == "" {return movies}
        print("Filtering for: \(searchText)")
        let filtered = movies.filter { movie in
            movie.title.localizedCaseInsensitiveContains(searchText)
        }
        print("Filtered Movies: \(filtered.map { $0.title })")
        return filtered
    } // Move to controller?
    
    func getMovies(byCategory category: String, from cinema: Cinema) -> [Movie] {
        cinema.movies.filter { $0.category.contains(category) }
    }
    
    
}
