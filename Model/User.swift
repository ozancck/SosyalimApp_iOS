//
//  User.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 6.08.2023.
//

import Foundation

struct User: Codable {
    var id: Int?
    var email: String?
    var name : String?
    var verifyCode: String?
    var verified: Bool?
    var createdAt: String?
    var updatedAt: String?
}
