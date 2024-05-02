//
//  Seat.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import Foundation

struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    var isOccupied: Bool
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0, isOccupied: false) }
}
