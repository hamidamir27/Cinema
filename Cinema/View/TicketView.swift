//
//  TicketView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct TicketView: View {
    @State var animateBool = true
    
    var tickets = [Ticket(date: "04/04/2024", time: "12:30", cinema: "1", seat: "5D", movie: Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]
    ])), Ticket(date: "08/04/2024", time: "2:30", cinema: "1", seat: "5D", movie: Movie(image: "ghostbusters", title: "Ghost Busters", subtitle: "Ghost hunters tackle supernatural threats.", showTimes: [
        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]
    ]))]
//    var tickets: [Ticket] = []
    
    var body: some View {
        ZStack {
            CircleBackground(colourString: "Green")
                .blur(radius: animateBool ? 30: 100)
                .offset(x: animateBool ? -50 : -130, y: animateBool ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animateBool.toggle()
                    }
                }
            
            CircleBackground(colourString: "purple")
                .blur(radius: animateBool ? 30: 100)
                .offset(x: animateBool ? 100 : 130, y: animateBool ? 150 : 100)
            
            VStack(spacing: 10.0) {
                Text("Mobile Tickets")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("simply scan the barcode at the register")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundColor(.white)
                
                if tickets.isEmpty{
                    VStack{
                        Text("You have no avaliable tickets")
                        Spacer()
                        Text("When you purchase a ticket it will be displayed here")
                    }
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                }
                else{
                    TabView {
                        ForEach(tickets, id: \.id) { ticket in
                            TicketCard(ticket: ticket)
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .padding()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
                
                
            }
            
            .padding(.horizontal, 20)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
        }
        .background{
            LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    TicketView()
}
