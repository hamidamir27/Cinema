//
//  SeatSelectionView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct SeatSelectionView: View {
    var selectedTime: String
    @ObservedObject var viewController = SeatSelectionViewController()
    var movie : Movie
    var selectedCinema : String
    
    var body: some View {
        VStack(spacing: 0.0){
            HStack{
                Text("Choose Seats")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.top, 46)
            .padding(.horizontal, 20)
            
            //Seat grid
            ScrollView(showsIndicators: true) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 5), spacing: 20) {
                    ForEach(viewController.seats.indices, id: \.self) { index in
                        ChairView(
                            seat: viewController.seats[index],
                            onSelect: { selectedSeat in
                                viewController.selectSeat(at: index)
                            },
                            onDeselect: { deselectedSeat in
                                viewController.selectSeat(at: index)  // Assuming toggle behavior in selectSeat
                            }
                        )
                        .padding()
                    }
                }
                .frame(maxWidth: 280)
                .padding()
            }
            Text("Selected Time: \(selectedTime)")
            
            HStack{
                HStack{
                    Text("Taken")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .cornerRadius(10)
                }
                HStack{
                    Text("Avaliable")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                }
                HStack{
                    Text("Selected")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarItems(trailing: NavigationLink("Next", destination: ConfirmBookingView(movie: movie, selectedTime: selectedTime, selectedCinema: selectedCinema, selectedSeat: viewController.selectedSeats)))
        
    }
}

struct SeatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleMovie = Movie(
            image: "exampleImage",
            title: "Example Movie",
            subtitle: "An example movie subtitle",
            showTimes: ["2024-04-29": ["10:00 AM", "1:00 PM", "4:00 PM"]],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "\($0)", isOccupied: $0 % 5 == 0) }  // Every fifth seat is occupied
        )

        // Example seats controller
        let seatsController = SeatSelectionViewController(seats: exampleMovie.seats)
        // Assume selectedTime, selectedDate, and selectedCinema are hard-coded for simplicity
        let selectedTime = "12:00 PM"
        let selectedCinema = "Cinema 1"

        // Create the ticket controller (if needed)


        // Return the SeatSelectionView with all required parameters
        SeatSelectionView(
            selectedTime: selectedTime,
            viewController: seatsController,
            movie: exampleMovie,
            selectedCinema: selectedCinema
        )
    }
}
