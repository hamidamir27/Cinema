//
//  BookingView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct BookingView: View {
    @State var movie : Movie
    @State var gradient = [Color(.blue).opacity(0.0), Color(.blue), Color(.blue), Color(.blue)]
    @State var times = ["12:00", "1:00pm", "2:00pm"]
    @State var selection : String?
    
    var body: some View {

        ZStack{
            ZStack {
                Image(movie.image)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                
                VStack{
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 800)
                }
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
            }
            .ignoresSafeArea()
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                VStack{
                    Text(movie.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                    Text(movie.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    Text("Select Date & Time")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 380)
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                VStack {
                    List(times, id:\.self, selection: $selection){ time in
                        Text(time)
                    }
                }
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 280, maxHeight: 280)
                .cornerRadius(10.0)
                NavigationLink("Next", destination: SeatSelectionView())
                    .foregroundColor(.white)
                    .padding(10)
                    .fontWeight(.bold)
                    .background(.gray.opacity(0.6))
                    .cornerRadius(10.0)
            }
        }
    }
}

#Preview {
    BookingView(movie : Movie(image: "challengers", title: "Challengers", subtitle: "Tashi, once a tennis player herself, has taken her husband, Art, and transformed him from an average player to a globally renowned Grand Slam champion", showTimes: [
        "29/04/2024": ["10:00 AM", "1:00 PM", "4:00 PM"],
        "30/04/2024": ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"]
    ]))
}
