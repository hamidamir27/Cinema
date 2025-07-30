//
//  TicketCard.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct TicketCard: View {
    
    @State var ticket : Ticket
    
    var body: some View {
        
        VStack(){
            Image(ticket.movie.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 250, height:225, alignment: .top)
                .cornerRadius(10)
            
            VStack{
                Text(ticket.movie.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(ticket.movie.subtitle)
                    .font(.subheadline)
                Image("barcode")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: 250, maxHeight: 150)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .background(Color.gray.opacity(0.7))
            .cornerRadius(4)
            
            .foregroundColor(.white)
            VStack{
                HStack{
                    Text("Cinema")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text(ticket.cinema)
                    
                }
                HStack{
                    Text("Date")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text(ticket.time)
                    
                }
                HStack{
                    Text("Seat")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text(ticket.getSeatAsString())
                    
                }
            }
            .padding()
            .foregroundColor(.white)
            .font(.footnote)
            .foregroundColor(.white)
            .background(.gray.opacity(0.7))
            .cornerRadius(4.0)
        }
        .frame(width: 250)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TicketCard(ticket : Ticket(time: "12:30", cinema: "4", seat: [Seat(id: "5d", isOccupied: true)], movie: Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]
    ], category: ["New Release"], seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) })))
}
