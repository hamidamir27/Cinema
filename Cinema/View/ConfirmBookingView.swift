//
//  ConfirmBookingView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct ConfirmBookingView: View {
    
    @State var ticket = Ticket(date: "04/04/2024", time: "12:30", cinema: "4", seat: "5D", movie: Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]
    ]))
    @State var animateBool : Bool = false
    
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
                VStack{
                    Text("Confirm Details")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("Check your details")
                        .frame(maxWidth: 248)
                        .font(.body)
                        .foregroundColor(.white)
                }
                .padding()
                
                VStack(spacing: 2.0){
                    Image(ticket.movie.image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                }
                .frame(width: 250, height:325, alignment: .top)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .cornerRadius(10)
                
                VStack{
                    Text(ticket.movie.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(ticket.movie.subtitle)
                    HStack{
                        Text("Cinema")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text(ticket.cinema)
                            
                    }
                    HStack{
                        Text("Seat")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text(ticket.seat)
                            
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
                Button(action: {print("Confirmed")}, label: {
                    Text("Confirm")
                })
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
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
    ConfirmBookingView()
}
