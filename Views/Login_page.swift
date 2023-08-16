//
//  Login_page.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 30.07.2023.
//

import SwiftUI

struct Login_page: View {

    
    @State var keyboardHeight: CGFloat = 0.0

    @State var loginModelObj = LoginModel()

    @ObservedObject var loginPageVM = Login_PageVM()
    
    
    @State var passError = false
    @State var mailError = false
    @State var error = false
    @State var errorMessage = ""

    let mail_label = "Mail"
    @State private var mail = ""

    let pass_label = "Sifre"
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

                    .padding(.top, 160)
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Tekrar ")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            Text(" Hosgeldin!")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                        }
                        .padding(.top, 10)

                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8)

                    Spacer()

                    FloatingTextField(title: self.mail_label, text: self.$mail, icon: "mail", keyboardType: .emailAddress)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .foregroundColor(.blue)
                    
                    
                   

                    FloatingSecureField(title: self.pass_label, password: self.$pass, icon: "lock")
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .foregroundColor(.blue)

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
                       

                    HStack {
                        Spacer()

                        Button {
                            print("sadkasodfaoskdfaoskfasokf")
                        } label: {
                            Text("Sifremi Unuttum?")
                                .font(.callout)
                                .bold()
                                .foregroundColor(Color("primary"))
                        }

                    }.padding(.top)
                        .frame(width: UIScreen.main.bounds.width * 0.8)

                    Button {
                        

                        // huseyinakbas@posta.mu.edu.tr
                        
                        if self.mail.isEmpty || self.mail == nil {
                            self.errorMessage = "E-posta adresi giriniz!"
                            self.error = true
                            
                        }else {
                            if self.pass.isEmpty || self.pass == nil {
                                self.errorMessage = "Şifre Giriniz!"
                                self.error = true
                                
                            }else{
                                loginModelObj.email = self.mail
                                loginModelObj.password = self.pass

                                loginPageVM.DoLogin(loginModel: loginModelObj) { response in
                                    if response.status == "2001" {
                                        
                                        if (response.user?.verified)! {
                                            if let window = UIApplication.shared.windows.first {
                                                window.rootViewController = UIHostingController(rootView: TabBarView()) // Hedef sayfa gösterilir
                                                }
                                        }else {
                                            if let userId = response.user?.id {
                                                if let window = UIApplication.shared.windows.first {
                                                    window.rootViewController = UIHostingController(rootView: Verify_page(userId: String(userId), fromWhere: 1)) // Hedef sayfa gösterilir
                                                    }
                                            }
                                        }
                                        
                                        

                                    } else {
                                        if response.status == "1001" {
                                            self.errorMessage = response.message ?? "Bir sorun oluştu."
                                            self.error = true
                                        } else if response.status == "1002" {
                                            self.errorMessage = response.message ?? "Bir sorun oluştu."
                                            self.error = true
                                        }
                                    }
                                }
                            }
                                
                        }

                       

                    } label: {
                        Text("Giris Yap")
                            .modifier(ButtonModifier(buttonType: .blueButton))
                    }
                    .onChange(of: self.mail) { newValue in
                        self.error = false
                        self.passError = false
                            
                           }
                    
                    .onChange(of: self.pass) { newValue in
                        self.error = false
                        self.mailError = false
                            
                           }
                    
                    

                    HStack {
                        VStack {
                            Divider()
                        }
                        Text("Veya")
                            .font(.caption)
                            .foregroundColor(.gray)
                        VStack {
                            Divider()
                        }
                    }
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width * 0.8)

                    NavigationLink {
                        SignUp_page()
                    } label: {
                        RadiusButton(title: "Kayit Ol", color: .gray)
                    }
                }
                
                
               
                

                .padding(.bottom, 190)
            }
        }

        .navigationBarBackButtonHidden()
    }
}

struct Login_page_Previews: PreviewProvider {
    static var previews: some View {
        Login_page()
    }
}

struct FloatingTextField: View {
    let title: String
    let text: Binding<String>
    let icon: String
    let keyboardType: UIKeyboardType?
  
    
    

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .opacity(text.wrappedValue.isEmpty ? 0 : 1)
                .offset(y: text.wrappedValue.isEmpty ? 20 : 0)
            HStack {
                Image(systemName: icon)
                    .scaledToFit()
                TextField(title, text: text)
                    .keyboardType(keyboardType ?? .default)
                    .autocapitalization(.none)
                    
            }
            .padding(.bottom, 8)

            Rectangle() // Underline
                .frame(height: UIScreen.main.bounds.height * 0.0009)
                .foregroundColor(Color.gray)
        }.animation(.default)
    }
}

struct FloatingSecureField: View {
    let title: String
    let password: Binding<String>
    let icon: String
    @State private var showPassword = false

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .opacity(password.wrappedValue.isEmpty ? 0 : 1)
                .offset(y: password.wrappedValue.isEmpty ? 20 : 0)
            HStack {
                Image(systemName: icon)
                    .padding(.leading, 3)
                    .scaledToFit()

                if self.showPassword {
                    TextField(title, text: password)
                        .textContentType(.password)
                } else {
                    SecureField(title, text: password)
                        .textContentType(.password)
                }

                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")

                        .foregroundColor(showPassword ? Color("primary") : .secondary)
                        .scaledToFit()
                }
            }
            .padding(.bottom, 8) // Add some bottom padding for the underline

            Rectangle() // Underline
                .frame(height: UIScreen.main.bounds.height * 0.0009)
                .foregroundColor(Color.gray) // You can customize the color here
        }
        .animation(.default)
    }
}
