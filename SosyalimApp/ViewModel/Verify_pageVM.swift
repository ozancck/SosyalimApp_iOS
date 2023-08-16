//
//  Verify_PageVM.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 6.08.2023.
//

import Foundation
import Alamofire

class Verify_pageVM: ObservableObject {
    
    
    
    func postCode(verifyModel: VerifyModel, completion: @escaping (Response) -> Void) {
        // if Utilities().isInternetAvailable() {

        AF.request(Router.verify(parameters: verifyModel)).validate().responseDecodable(of: Response.self) { response in

            print("debugDesc", response.debugDescription)
            switch response.result {
            case .success:

                print("verifySucces")

                completion(response.value!)

                if let bodyData = response.request?.httpBody {
                    if let bodyString = String(data: bodyData, encoding: .utf8) {
                        print("Request Body: \(bodyString)")
                    }
                }

            case .failure:

                print("verifyFail")

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

