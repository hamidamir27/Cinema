//
//  SeatSelectionViewController.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

class SeatSelectionViewController : ObservableObject {
    

    @Published var seats: [Seat]
    
    init(seats: [Seat]) {
        self.seats = seats
    }
    
    init(rows: Int = 5, columns: Int = 6) {
        self.seats = []
        for row in 0..<rows {
            for column in 0..<columns {
                let rowLabel = String(Character(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(row))!))
                let seatId = "\(rowLabel)\(column + 1)"
                let isOccupied = Bool.random()  // Example, randomly set occupancy
                self.seats.append(Seat(id: seatId, isOccupied: isOccupied))
            }
        }
    }

    func selectSeat(at index: Int) {
        guard !seats[index].isOccupied else { return }  // Can't select an occupied seat
//        seats.indices.forEach { seats[$0].isSelected = false }// Toggle selection
        seats[index].isSelected.toggle()
    }
    
    var selectedSeats: [Seat] {
        seats.filter { $0.isSelected }
    }
    
}
