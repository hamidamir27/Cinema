//
//  Cinema.swift
//  Cinema
//
//  Created by Felix Lush on 6/5/2024.
//

import Foundation

struct Cinema : Hashable, Identifiable {
    var id = UUID()
    var movies : [Movie]
    var name : String
}
