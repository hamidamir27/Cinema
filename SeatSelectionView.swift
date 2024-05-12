import SwiftUI

struct SeatSelectionView: View {
    @State var selectedTime: String?
    @State private var seats: [Seat] = Array(repeating: Seat.default, count: 30)

    // Randomly occupy seats on initialization
    init() {
        _seats = State(initialValue: (0..<30).map { index in
            Seat(id: UUID(), row: index / 5, number: index % 5, isOccupied: Bool.random())
        })
    }

    var body: some View {
        VStack(spacing: 0.0) {
            Text("Choose Seats")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.top, 46)
                .padding(.horizontal, 20)
            
            // Seat grid
            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
            ScrollView(showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach($seats, id: \.id) { $seat in
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(seat.isOccupied ? .red : (seat.isSelected ? .blue : .gray))
                            .cornerRadius(10)
                            .onTapGesture {
                                if !seat.isOccupied {
                                    seat.isSelected.toggle()
                                }
                            }
                    }
                    .padding()
                }
                .frame(maxWidth: 280)
                .padding()
            }

            LegendView()
        }
        .navigationBarItems(trailing: NavigationLink("Next", destination: ConfirmBookingView()))
    }

    @ViewBuilder
    func LegendView() -> some View {
        HStack {
            Legend(color: .red, text: "Taken")
            Legend(color: .gray, text: "Available")
            Legend(color: .blue, text: "Selected")
        }
    }
}

struct Legend: View {
    var color: Color
    var text: String

    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(color)
                .cornerRadius(10)
            Text(text)
        }
    }
}

// Add previews and ensure your structures are correct
struct SeatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SeatSelectionView()
    }
}
