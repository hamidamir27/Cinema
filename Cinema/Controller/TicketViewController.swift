//
//  TicketViewController.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

class TicketViewController: ObservableObject{
    
    // Needs an array of tickets - these tickets are saved on the local device
    @Published var tickets: [Ticket] = []

    
    func addTicketToWallet(ticket : Ticket){
        tickets.append(ticket)
    }
    
    
}
