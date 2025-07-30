//
//  BookingView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct BookingView: View {
    @State var gradient = [Color.blue.opacity(0.0), Color.blue, Color.blue, Color.blue]
    @State var selection: String?
    @ObservedObject var viewController : BookingViewController
    var selectedCinema : String
    var body: some View {
        ZStack {
            backgroundLayer
            contentLayer
        }
    }

    private var backgroundLayer: some View {
        ZStack {
            Image(viewController.movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: .infinity)
                .overlay(
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 800)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                )
                .ignoresSafeArea()
        }
    }

    private var contentLayer: some View {
        VStack {
            movieInfo
            timeSelectionList
            navigationLink
        }
    }

    private var movieInfo: some View {
        VStack {
            Text(viewController.movie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text(viewController.movie.subtitle)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(30)
            Text("Select Date & Time")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: 380)
    }

    private var timeSelectionList: some View {
        List {
            ForEach(Array(viewController.timesByDate.keys.sorted()), id: \.self) { date in
                Section(header: Text(date)) {
                    ForEach(viewController.timesByDate[date] ?? [], id: \.self) { time in
                        TimeRow(time: time, isSelected: self.selection == "\(date) \(time)") {
                            self.selection = "\(date) \(time)"
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 280, maxHeight: 280)
        .cornerRadius(10.0)
    }

    private var navigationLink: some View {
        NavigationLink("Next", destination: SeatSelectionView(selectedTime: selection ?? "default time", movie: viewController.movie, selectedCinema: selectedCinema), isActive: .constant(selection != nil))
            .disabled(selection == nil)
            .foregroundColor(.white)
            .padding(10)
            .fontWeight(.bold)
            .background(selection != nil ? Color.gray.opacity(0.6) : Color.gray.opacity(0.3))
            .cornerRadius(10.0)
    }
}

struct TimeRow: View {
    var time: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        HStack {
            Text(time)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy Movie object
        let exampleMovie = Movie(
            image: "kungfupanda",
            title: "Kung Fu Panda",
            subtitle: "A clumsy panda learns martial arts.",
            showTimes: [
                "2024-04-29": ["11:00 AM", "2:00 PM"],
                "2024-05-02": ["5:00 PM", "8:00 PM"]
            ],
            category: ["New Release"],
            seats: (1...30).map { Seat(id: "Seat \($0)", isOccupied: $0 % 3 == 0) }
        )
        
        // Initialize the BookingViewController with the movie
        let bookingController = BookingViewController(movie: exampleMovie)
        
        // Provide all required parameters
        return BookingView(
            viewController: bookingController,
            selectedCinema: "Cinema 1"
        )
    }
}

