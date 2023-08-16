//
//  SignUp_PageVM.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 6.08.2023.
//

import Foundation
import Alamofire


class SignUp_pageVM: ObservableObject {
    
    
    
    func signUp(signUpModel: SignUpModel, completion: @escaping (Response) -> Void) {
        // if Utilities().isInternetAvailable() {

        AF.request(Router.signUp(parameters: signUpModel)).validate().responseDecodable(of: Response.self) { response in

            print("debugDesc", response.debugDescription)
            switch response.result {
            case .success:

                print("signUpSucces")

                completion(response.value!)

                if let bodyData = response.request?.httpBody {
                    if let bodyString = String(data: bodyData, encoding: .utf8) {
                        print("Request Body: \(bodyString)")
                    }
                }

            case .failure:

                print("signUpFail")

                if let bodyData = response.data {
                    do {
                        // Yanıtın "body" kısmını Response yapısına dönüştür
                        let errorResponse = try JSONDecoder().decode(Response.self, from: bodyData)
                        completion(errorResponse)
                    } catch {
                        print("Error decoding error response: \(error)")
                    }
                }

                if let bodyData = response.request?.httpBody {
                    if let bodyString = String(data: bodyData, encoding: .utf8) {
                        print("Request Body: \(bodyString)")
                    }
                }

                // self.showAlert(message: "systemError".localized, title: "errorTitle".localized)
            }
        }
        //  } else {
        // showAlert(message: "networkError".localized, title: "warningTitle".localized)
        // }
    }
    
    
    
}
