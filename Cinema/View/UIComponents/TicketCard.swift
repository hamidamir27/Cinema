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
        VStack(spacing: 0.0){
            VStack(spacing: 2.0){
                Image(ticket.movie.image)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
            }
            .frame(width: 250, height:225, alignment: .top)
            .foregroundColor(.white)
            .shadow(radius: 10)
            .cornerRadius(10)
        }
        VStack{
            Text(ticket.movie.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(ticket.movie.subtitle)

            Image("barcode")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 250, maxHeight: 150)
                .cornerRadius(10.0)
                .padding()
    
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
                Text("Time")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text(ticket.date)
                    
            }
        }
        .padding()
        .foregroundColor(.white)
        .font(.footnote)
        .shadow(radius: 10)
        .background(.gray.opacity(0.7))
        .cornerRadius(4.0)
        .frame(maxWidth: 250)
    }
}

#Preview {
    TicketCard(ticket : Ticket(date: "04/04/2024", time: "12:30", cinema: "4", seat: "5D", movie: Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]
    ])))
}
