//
//  Router.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 5.08.2023.
//

import Alamofire
import Foundation

enum Router: URLRequestConvertible {
    case login(parameters: LoginModel)
    case signUp(parameters: SignUpModel)
    case verify(parameters: VerifyModel)
    
    

    static let baseURLString = APPURL.BaseURL

    var method: HTTPMethod {
        switch self {
        case .login,
            .verify,
            .signUp:
            return .post

       
        }
    }

    var path: String {
        switch self {
        case .login(let parameters):
            return "/auth/login"
        case .signUp(let parameters):
            return "/auth/signup"
            
        case .verify(let parameters):
            return "/auth/verify"
            
        }


    }

    // MARK: URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = method

        /// iç içe slash ların oldugu requestlerde encoding gerekmiyor
        /// POST requestte json object gönderiliyorsa JSONParameterEncoder kullanılması gerekiyor

        switch self {
        /// header olmadan request yapiliyor. bu requestler sifre alma ile ilgili requestler oldugu icin dogrulama yok
       
            
        case let .login(parameters):
            urlRequest = try JSONParameterEncoder.default.encode(parameters, into: urlRequest)
            urlRequest.method = .post
      
            break
            
        case .signUp( let parameters):
            urlRequest = try JSONParameterEncoder.default.encode(parameters, into: urlRequest)
            urlRequest.method = .post
        
            break
            
        case .verify(let parameters):
            urlRequest = try JSONParameterEncoder.default.encode(parameters, into: urlRequest)
            urlRequest.method = .post
      
            break
       
            
            
            
        default:
         
            
            break
        }
        return urlRequest
    }
}
