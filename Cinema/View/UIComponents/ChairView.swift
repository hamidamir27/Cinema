import SwiftUI

struct ChairView: View {
    var seat: Seat
    var width: CGFloat = 50
    var isSelectable = true
    var onSelect: ((Seat)->()) = {_ in }
    var onDeselect: ((Seat)->()) = {_ in }

    var body: some View {
        VStack(spacing: 2) {
            Rectangle()
                .frame(width: width, height: width * 2/3)
                .foregroundColor(colorForSeat())
                .cornerRadius(width / 5)
            
            Rectangle()
                .frame(width: width - 10, height: width / 5)
                .foregroundColor(colorForSeat())
                .cornerRadius(width / 5)
        }
        .onTapGesture {
            if isSelectable && !seat.isOccupied {
                if seat.isSelected {
                    onDeselect(seat)
                } else {
                    onSelect(seat)
                }
            }
        }
    }

    private func colorForSeat() -> Color {
        if seat.isOccupied {
            return Color.red  // Red if the seat is occupied
        } else if seat.isSelected {
            return Color.blue  // Blue if the seat is selected
        } else {
            return Color.gray.opacity(0.5)  // Gray if the seat is available
        }
    }
}

// Preview configuration
struct ChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChairView(seat: Seat(id: "1", isOccupied: false))
    }
}
