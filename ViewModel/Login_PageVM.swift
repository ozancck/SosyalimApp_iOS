//
//  Login_PageVM.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 5.08.2023.
//

import Alamofire
import Foundation

class Login_PageVM: ObservableObject {
    func DoLogin(loginModel: LoginModel, completion: @escaping (Response) -> Void) {
        // if Utilities().isInternetAvailable() {

        AF.request(Router.login(parameters: loginModel)).validate().responseDecodable(of: Response.self) { response in

            print("debugDesc", response.debugDescription)
            switch response.result {
            case .success:

                print("loginSucces")

                completion(response.value!)

                if let bodyData = response.request?.httpBody {
                    if let bodyString = String(data: bodyData, encoding: .utf8) {
                        print("Request Body: \(bodyString)")
                    }
                }

            case .failure:

                print("loginFail")

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
