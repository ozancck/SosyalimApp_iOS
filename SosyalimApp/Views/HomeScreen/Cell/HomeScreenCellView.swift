//
//  HomeScreenCellView.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 16.08.2023.
//

import SwiftUI

struct HomeScreenCellView: View {
    @State var PPurl: String
    @State var name: String
    @State var gender: String
    @State var postDate: String
    @State var content: String
    @State var like: Int
    @State var liked: Bool
    @State var comment: Int

    var body: some View {
        
        if gender == "Male" {
            ZStack {
                
                
              
                    VStack {
                     
                        HStack(alignment: .top) {
                            
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
                            
                           
                            
                            VStack {
                                HStack {
                                  
                                    
                                    Text(name)
                                        .font(.headline)
                                        .padding(.trailing, 5)
                                    
                                    HStack {
                                      
                                        Circle()
                                            .frame(width: UIScreen.main.bounds.height * 0.007)
                                            .opacity(0.3)
                                        
                                        Text(postDate)
                                            .font(.caption2)
                                            
                                    }
                                    
                                    Spacer()
                                    
                                }
                                HStack{
                                   
                                    
                                    //textWithHashtags(content, color: .blue)
                                    Text(content)
                                        .font(.callout)
                                       
                                        
                                        

                                }
                                
                                HStack(spacing: 15) {
                                    
                                    HStack(spacing: 2) {
                                        Button {
                                            
                                        } label: {
                                            
                                            if self.liked {
                                                Image(systemName: "heart.fill")
                                                    .font(.system(size: 22))
                                            }else {
                                                Image(systemName: "heart")
                                                    .font(.system(size: 22))
                                            }
                                            
                                           
                                                
                                                            
                                                
                                            
                                        }
                                        Text(String(like))
                                            .font(.system(size: 15))
                                    }
                                    
                                    
                                    
                                    HStack(spacing: 2) {
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "message")
                                                .font(.system(size: 22))
                                            
                                            
                                        }
                                        
                                        Text(String(comment))
                                            .font(.system(size: 15))
                                        
                                        
                                    }
                                    
                                    
                                  
                                    /*
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "bookmark.square")
                                            .font(.system(size: 20))
                                        
                                        
                                    }
                                     */
                                    
                                    Spacer()
                                    
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "paperplane")
                                            .font(.system(size: 22))
                                        
                                        
                                    }
                                    
                                    

                                }
                                .padding(.top, 0.5)
                                .padding(.trailing)
                                .padding(.trailing)
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        Divider()
                       
                    }
                        
                    
                    
                   
                   
                    
                    
                    
                    
                
                

                
                
            }
        }
        
        
    }
    
    
    
    func textWithHashtags(_ text: String, color: Color) -> Text {
        let words = text.split(separator: " ")
        var output: Text = Text("")

        for word in words {
            if word.hasPrefix("#") {
                output = output + Text(" ") + Text(String(word))
                    
                    .foregroundColor(color)
                   
            } else {
                output = output + Text(" ") + Text(String(word))
            }
        }
        return output
    }

}



struct HomeScreenCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCellView(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male", postDate: "Just Now", content: "Exploring new horizons and embracing aspdjsalkdfjalsjdfljasdfjaslkfjldskfjlksdjflksdjflksdjflskdjflksdflsdkfjlsdkfjlskdfjksdjlsdkjflksdjfjdfkdjkfjdskflsdkfjlsdkfjevery moment. 🌄 #AdventureAwaits #Wanderlust tabi efendim tabi", like: 100, liked: true, comment: 25)
        
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 500))
    }
}
