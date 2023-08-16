//
//  StartView.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 30.07.2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            ZStack {
                // Background Image
                Image("start_image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // Your content goes here
                
                VStack {
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text("Sosyalim")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Bundan sonraki hayatinizda basarilar diliyorum hepinize degerli dostlarim sizler bizim icin onemlisiniz")
                            .font(.callout)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .foregroundColor(.white)
                            .padding(.top, 2)
                        
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 30)
                    
                    
                    VStack{
                        NavigationLink {
                            Login_page()
                        } label: {
                            Text("Giriş Yap")
                                .modifier(ButtonModifier(buttonType: .whiteButton))
                        }
                        
                        NavigationLink {
                            SignUp_page()
                        } label: {
                            RadiusButton(title: "Kayit Ol", color: .white)
                        }

                       
                        
                        
                       
                        
                    }
                    .padding(.bottom, 75)
                    
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
