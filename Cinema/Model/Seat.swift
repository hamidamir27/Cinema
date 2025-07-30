//
//  Seat.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import Foundation

struct Seat: Identifiable, Hashable {
    let id: String
    var isOccupied: Bool
    var isSelected: Bool = false

    static var `default`: Seat {
        return Seat(id: "DefaultID", isOccupied: false)
    }
}
