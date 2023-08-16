//
//  Verify_page.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 6.08.2023.
//

import SwiftUI

struct Verify_page: View {
    
    
    
    
   
    
    @ObservedObject var verifyPageVM = Verify_pageVM()
    @State var verifyModelObj = VerifyModel()
    
    
    @State var userId: String
    let verify_label = "Verify Code"
    
    
    
    @State private var code = ""
    @State var fromWhere : Int //if 1 from singIn, if 0 from SingUp
    
    @State var error = false
    @State var errorMessage = ""
    
    @ObservedObject var verify_pageVM = Verify_pageVM()
   

    var body: some View {
        
        NavigationView {
            
            
            VStack {
                VStack {
                    FloatingTextField(title: verify_label, text: $code, icon: "number", keyboardType: .numberPad)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .onChange(of: code) { newValue in
                            if newValue.count > 6 {
                                code = String(newValue.prefix(6))
                            }
                        }
                    
                    
                    if error {
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundColor(.red)
                            Text(self.errorMessage)
                                .foregroundColor(.red)

                            Spacer()
                        }
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .transition(.opacity.animation(.easeInOut(duration: 0.5)))
                        
                        
                    }
                }
                
                Button {
                    
                    
                    verifyModelObj.userId = userId
                    verifyModelObj.verifyCode = self.code
                    verifyPageVM.postCode(verifyModel: verifyModelObj) { response in
                        if response.status == "1006" {
                            //dogruysa kod
                            
                            if self.fromWhere == 0 {
                                if let window = UIApplication.shared.windows.first {
                                    window.rootViewController = UIHostingController(rootView: Login_page()) // Hedef sayfa gösterilir
                                    }
                            }else {
                                if let window = UIApplication.shared.windows.first {
                                    window.rootViewController = UIHostingController(rootView: TabBarView()) // Hedef sayfa gösterilir
                                    }
                            }
                            
                        }else {
                            self.errorMessage = response.message!
                            self.error = true
                        }
                    }
                    
                    
                    
            } label: {
                Text("Giris Yap")
                    .modifier(ButtonModifier(buttonType: .blueButton))
                    
                    
            }
                
                
                
                
                
            }
            .onChange(of: self.code) { newValue in
                self.error = false
                
                    
                   }
        }
    }
}

struct Verify_page_Previews: PreviewProvider {
    static var previews: some View {
        Verify_page(userId: "221", fromWhere: 0)
    }
}
