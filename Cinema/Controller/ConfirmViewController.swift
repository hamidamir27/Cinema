//
//  ConfirmViewController.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

class ConfirmViewController : ObservableObject{
    
    @Published var tickets: [Ticket] = []

    func confirmTicket(movie: Movie, date: String, time: String, cinema: String, seat: [Seat]) {
        let newTicket = Ticket(time: time, cinema: cinema, seat: seat, movie: movie)
        tickets.append(newTicket)
        // Additional handling like saving to a database or updating the UI
    }
    
}
