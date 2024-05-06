//
//  Ticket.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import Foundation

struct Ticket{
    var id = UUID()
    var date : String
    var time : String
    var cinema : String
    var seat: String // Should be var seat : [Seat]
    
    var movie : Movie
}
