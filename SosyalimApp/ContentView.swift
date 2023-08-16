//
//  ContentView.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 30.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeScreenCellView(url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
