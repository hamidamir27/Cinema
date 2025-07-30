//
//  BookingViewController.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

class BookingViewController : ObservableObject{
    
    @Published var movie: Movie
    @Published var timesByDate: [String: [String]] = [:]


    init(movie: Movie) {
        self.movie = movie
        self.timesByDate = movie.showTimes
    }
    
    
}
