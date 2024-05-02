//
//  User.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import Foundation

struct User {
    var id = UUID()
    var name: String
    var email: String
    var cinema: String
    var Tickets: [Ticket]
}
