//
//  Seat.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import Foundation

struct Seat: Identifiable {
    let id: UUID
    let row: Int
    let number: Int
    var isOccupied: Bool
    var isSelected: Bool = false

    static var `default`: Seat {
        Seat(id: UUID(), row: 0, number: 0, isOccupied: false, isSelected: false)
    }
}
