//
//  ConfirmBookingView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct ConfirmBookingView: View {
    
    @Environment(\.presentationMode) var presentationMode
//    @State var ticket = Ticket(time: "12:30", cinema: "4", seat: Seat(id: "A1", isOccupied: true), movie: Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
//        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
//        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]], category: ["New Release", "Most Popular"], seats:  (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
//    ))
    @State var animateBool : Bool = false
    @ObservedObject var viewController = ConfirmViewController()
    var movie: Movie
    var selectedTime: String
    var selectedCinema: String
    var selectedSeat: [Seat]
    @EnvironmentObject var ticketController: TicketViewController
    
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
                    Image(movie.image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                }
                .frame(width: 250, height:325, alignment: .top)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .cornerRadius(10)
                
                VStack{
                    Text(movie.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(movie.subtitle)
                    HStack{
                        Text("Cinema")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text(selectedCinema)
                            
                    }
                    HStack{
                        Text("Seat")
                            .fontWeight(.bold)
                        Spacer()
                        // Convert the array of seats to a string and display it
                        Text(selectedSeat.map { $0.id }.joined(separator: ", "))
                            
                    }
                    HStack{
                        Text("Time")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text(selectedTime)
                            
                    }
//                    HStack{
//                        Text("Time")
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        Spacer()
//                        Text(selectedDate)
//                    }
                }
                .padding()
                .foregroundColor(.white)
                .font(.footnote)
                .shadow(radius: 10)
                .background(.gray.opacity(0.7))
                .cornerRadius(4.0)
                .frame(maxWidth: 250)
                
                Button("Confirm Ticket") {
                    let newTicket = Ticket(time: selectedTime, cinema: selectedCinema, seat: selectedSeat, movie: movie)
                    ticketController.addTicketToWallet(ticket: newTicket)
                    // Optionally navigate away or show confirmation
                    presentationMode.wrappedValue.dismiss()
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
    ConfirmBookingView(viewController: ConfirmViewController(), movie: Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
        "2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "2024-04-30": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]], category: ["New Release", "Most Popular"], seats:  (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }), selectedTime: "12:00 PM", selectedCinema: "Cinema 4", selectedSeat: [Seat(id: "A1", isOccupied: true)])
}
