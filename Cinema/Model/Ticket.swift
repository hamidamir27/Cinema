//
//  Ticket.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import Foundation

struct Ticket{
    var id = UUID()
//    var date : String
    var time : String
    var cinema : String
    var seat: [Seat]// Should be var seat : [Seat]
    var movie : Movie
    
    init(id: UUID = UUID(), time: String, cinema: String, seat: [Seat], movie: Movie) {
        self.id = id
//        self.date = date
        self.time = time
        self.seat = seat
        self.cinema = cinema
        self.movie = movie
    }
    
//    init(cinema : String) {
//        self.id = UUID()
//        self.date = ""
//        self.time = ""
//        self.seat = ""
//        self.cinema = cinema
//        self.movie = 
//    }
    
    mutating func setSeat(seat : [Seat]){
        self.seat = seat
    }
    
    mutating func setMovie(movie : Movie){
        self.movie = movie
    }
    
    mutating func setTime(time : String){
        self.time = time
    }
    
    func getSeatAsString() -> String {
        let seatIDs = seat.map { $0.id } // Directly map seat IDs
        return seatIDs.joined(separator: ", ")
    }
    
}
