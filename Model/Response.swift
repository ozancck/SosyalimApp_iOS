//
//  Response.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 6.08.2023.
//

import Foundation


struct Response: Codable {
    
    var status: String?
    var message: String?
    var access_token: String?
    var user: User?
    
}

