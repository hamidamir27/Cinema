//
//  HomeView.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct MovieView: View {
    
    @State var animateBool : Bool = true
    @State var cinema : String
    @State private var searchText = ""
    @StateObject var viewController = MovieViewController()
    
    
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
            
            VStack(spacing: 0.0){
                VStack {
                    Text("Pick a Movie")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    Text("Cinema: \(cinema)")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                
                SearchBar(searchText: $searchText)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ScrollSection(title: "New Releases", movies: viewController.newReleases) // Pass an array of movies from the cinema object to here
                        ScrollSection(title: "Vintage Movies", movies: viewController.vintageMovies) // Pass an array of movies from the cinema object to here
                        ScrollSection(title: "Local Favourites", movies: viewController.mostPopular) // Pass an array of movies from the cinema object to here
                    }
                    .padding(.bottom, 90)
                }
                
                
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background{
            LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    MovieView(cinema: "Ultimo")
}
