//
//  MenuBar.swift
//  Cinema
//
//  Created by Felix Lush on 29/4/2024.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Tab = .home
    
//    init() {
//        UITabBar.appearance().isTranslucent = true
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentTab) {
                    HomeView(cinema: "String")
                        .tag(Tab.home)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    Text("Search")
                        .tag(Tab.location)
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    TicketView()
                        .tag(Tab.ticket)
                        .tabItem {
                            Label("Tickets", systemImage: "ticket")
                        }
                    Text("Settings")
                        .tag(Tab.settings)
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
