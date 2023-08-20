//
//  SignUp_page.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 1.08.2023.
//

import SwiftUI

struct SignUp_page: View {
    
    
    @ObservedObject var signUpVM = SignUp_pageVM()
    
    @State var signUpModelObj = SignUpModel()
    
    @State var isEmpty = false
    
    @State var error = false
    @State var errorMessage = ""
    
    @State var nameError = false
    @State var mailError = false
    @State var passError = false
    
    
    let name_label = "SIGNUP_PAGE_VIEW_NAME_LABEL_TITLE"
    @State private var name = ""

    let mail_label = "SIGNUP_PAGE_VIEW_MAIL_LABEL_TITLE"
    @State private var mail = ""

    let pass_label = "SIGNUP_PAGE_VIEW_PASSWORD_LABEL_TITLE"
    @State private var pass = ""

    var body: some View {
        NavigationView {
            ZStack {
                Image("login_page")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { _ in
                    
                    
                    Spacer()
                    VStack {
                        Spacer()
                        Spacer()
                        Image("login")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    .padding(.top, 130)
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.4)
                .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Yeni Hesap")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            Text("Oluştur!")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                        }
                        .padding(.top, 10)

                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8)

                    Spacer()

                    VStack {
                        FloatingTextField(title: self.name_label, text: self.$name, icon: "person.fill", keyboardType: .default)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .foregroundColor(Color("primary"))

                        FloatingTextField(title: self.mail_label, text: self.$mail, icon: "mail.fill", keyboardType: .default)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .foregroundColor(Color("primary"))
                            .keyboardType(.emailAddress)

                        FloatingSecureField(title: self.pass_label, password: self.$pass, icon: "lock.fill")
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .foregroundColor(Color("primary"))
                        
                        
                        if error {
                            HStack {
                                Image(systemName: "exclamationmark.circle.fill")
                                    .foregroundColor(.red)
                                Text(self.errorMessage)
                                    .foregroundColor(.red)

                                Spacer()
                            }
                            .padding(.top)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .transition(.opacity.animation(.easeInOut(duration: 0.5)))
                            
                            
                        }
                    }
                    .padding(.bottom)

                    Button {
                        
                        if self.name.isEmpty {
                            self.isEmpty = true
                            self.nameError = true
                        }else {
                            self.isEmpty = false
                        }
                        
                        if self.mail.isEmpty {
                            self.isEmpty = true
                            self.mailError = true
                        }else {
                            self.isEmpty = false
                        }
                        
                        
                        if self.pass.isEmpty {
                            self.isEmpty = true
                            self.passError = true
                        }else {
                            self.isEmpty = false
                        }
                        
                        
                        if isEmpty == false {
                            signUpModelObj.name = self.name
                            signUpModelObj.email = self.mail
                            signUpModelObj.password = self.pass
                            
                            signUpVM.signUp(signUpModel: signUpModelObj) { response in
                                if response.status == "2002" {
                                    if let userId = response.user?.id {
                                        if let window = UIApplication.shared.windows.first {
                                            window.rootViewController = UIHostingController(rootView: Verify_page(userId: String(userId), fromWhere: 0)) // Hedef sayfa gösterilir
                                            }
                                    }
                                }else {
                                    self.errorMessage = response.message!
                                    self.error = true
                                }
                                
                             
                                
                                
                            }
                            
                            
                        }
                    
                    } label: {
                        Text("SIGNUP_PAGE_VIEW_SIGN_UP_BUTTON_TITLE")
                            .modifier(ButtonModifier(buttonType: .blueButton))

                    }.padding(.top)

                    HStack {
                        VStack {
                            Divider()
                        }
                        Text("SIGNUP_PAGE_VIEW_OR_DIVIDER_TITLE")
                            .font(.callout)
                            .foregroundColor(.gray)
                        VStack {
                            Divider()
                        }
                    }
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width * 0.8)

                    NavigationLink {
                        Login_page()
                    } label: {
                        RadiusButton(title: "SIGNUP_PAGE_VIEW_SIGN_IN_BUTTON_TITLE", color: .gray)
                    }
                }
                .padding(.bottom, 150)
            }
            .onChange(of: self.name) { newValue in
                self.error = false
                self.nameError = false
                    
                   }
            
            .onChange(of: self.mail) { newValue in
                self.error = false
                self.mailError = false
                    
                   }
            
            .onChange(of: self.pass) { newValue in
                self.error = false
                self.passError = false
                    
                   }
        }

        .navigationBarBackButtonHidden()
    }
}

struct SignUp_page_Previews: PreviewProvider {
    static var previews: some View {
        SignUp_page()
    }
}
