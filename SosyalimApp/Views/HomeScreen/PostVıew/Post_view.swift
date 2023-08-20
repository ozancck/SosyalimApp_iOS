//
//  Post_view.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 18.08.2023.
//

import SwiftUI

struct Post_view: View {
    @FocusState var focus: FocusedField?
    @State var PPurl: String
    @State var name: String
    @State var content = ""

    
    @State private var verticalOffset: CGFloat = 0.0
    @State private var gestureOffset: CGFloat = 0.0
    @State private var itemCount: Int = 200
    
    
    

    var body: some View {
        
        
            
                VStack {
                    
                    
                    HStack {
                        
                        Button {
                           
                            
                        } label: {
                            Image(systemName: "xmark")
                            
                                .bold()
                                .font(.system(size: 22))
                        }
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Text("POST_VIEW_DRAFTS_BUTTON_TITLE")
                                .foregroundColor(Color("primary"))
                                .font(.title2)
                                .bold()
                                .frame(width: UIScreen.main.bounds.width * 0.3)
                        }
                        
                        Button {
                        } label: {
                            Text("POST_VIEW_SHARE_BUTTON_TITLE")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .modifier(ButtonModifier(buttonType: .blueButton))
                                .frame(width: UIScreen.main.bounds.width * 0.2)
                                .cornerRadius(177)
                        }
                    }
                    
                    ScrollViewReader { value in
                        ScrollView(.vertical,showsIndicators: false) {
                           
                            
                            VStack {
                                HStack {
                                    VStack {
                                        HStack {
                                            AsyncImage(url: URL(string: PPurl)) { image in
                                                switch image {
                                                case let .success(image):
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(height: UIScreen.main.bounds.height * 0.06)
                                                        .clipShape(Circle()) // Görüntüyü daire şeklinde kırpın
                                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                                    
                                                default: Color.clear
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Text(name)
                                                .frame(height: UIScreen.main.bounds.height * 0.06)
                                                .font(.headline)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                        
                                        VStack {
                                            ZStack(alignment: .leading) {
                                                TextEditor(text: $content)
                                                    //.frame(height: UIScreen.main.bounds.height * 0.6)
                                                    .font(.title3)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                    .focused($focus, equals: .content)
                                                    .keyboardType(.default)
                                                
                                                VStack {
                                                    if content.isEmpty || content == "" {
                                                        Text("POST_VIEW_TEXT_EDITOR_PLACEHOLDER_TITLE")
                                                        
                                                            .lineLimit(2, reservesSpace: true)
                                                            .font(.title3)
                                                        
                                                            .bold()
                                                            .disabled(true)
                                                            .foregroundColor(.gray)
                                                            .padding(.top, 8)
                                                            .padding(.leading, 8)
                                                    }
                                                    Spacer()
                                                }
                                            }
                                            
                                            Spacer()
                                        }
                                        .padding(.top, -15)
                                        .onAppear {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                focus = .content
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .onAppear {
                            value.scrollTo(8, anchor: .top)
                        }
                        
                    }
                    
                    
                    

                    HStack {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30))

                        Image(systemName: "location")
                            .font(.system(size: 30))

                        Spacer()

                        Button {
                        } label: {
                            Text("POST_VIEW_CREATE_ACTIVITY_BUTTON_TITLE")
                                .foregroundColor(Color("primary"))
                                .font(.title3)
                                .bold()
                                .frame(width: UIScreen.main.bounds.width * 0.4)
                        }
                    }

                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
                    // .border(Color.black)
                }
                
                .toolbar(.hidden, for: .tabBar)
                .navigationBarBackButtonHidden()
               
                .padding()
            
        
       
        
        
    }
}

enum FocusedField: Hashable {
    case content
}

struct Post_view_Previews: PreviewProvider {
    static var previews: some View {
        Post_view(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "ozan cicek")
            .environment(\.locale, .init(identifier: "tr"))
    }
}
