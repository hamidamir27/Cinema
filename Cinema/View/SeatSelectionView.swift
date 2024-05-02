//
//  SeatSelectionView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct SeatSelectionView: View {
    @State var selectedTime : String?
    @State private var seats: [Seat] = Array(repeating: Seat.default, count: 30)
    
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
            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
            ScrollView (showsIndicators: true){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(seats.indices, id:\.self) { index in
                        ChairView(
                            seat: seats[index],
                            onSelect: { seat in
                                seats[index].isOccupied = true
                            },
                            onDeselect: { seat in
                                seats[index].isOccupied = false
                            }
                        )
                    }
                    .padding()
                }
                .frame(maxWidth: 280)
            .padding()
            }
            
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
        .navigationBarItems(trailing: NavigationLink("Next", destination: ConfirmBookingView()))
        
    }
}

#Preview {
    SeatSelectionView()
}
