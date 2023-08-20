//
//  HomeScreen_view.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 19.08.2023.
//

import SwiftUI

struct HomeScreen_view: View {
    @State var PPurl: String
    
    
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        VStack {
                            AsyncImage(url: URL(string: PPurl)) { image in
                                switch image {
                                case let .success(image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width * 0.10)
                                        .clipShape(Circle()) // Görüntüyü daire şeklinde kırpın
                                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))

                                default: Color.clear
                                }
                            }
                            
                            
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.10)
                        .padding()
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color("primary"))
                    
                    
                    ScrollView(showsIndicators: false) {
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing every moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
                    }
                    .refreshable {
                        
                    }
                   
                    
                    

                }
                
                NavigationLink {
                    Post_view(PPurl: PPurl, name: "Ozan Cicek")
                } label: {
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            ZStack {
                                
                                Circle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width: UIScreen.main.bounds.width * 0.17)
                                    .padding()
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                            }
                          
                        }
                    }
                    .padding(.bottom, 30)
                }
                
            }
        }
      
        
        
    }
}

struct HomeScreen_view_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen_view(PPurl:"https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
}
