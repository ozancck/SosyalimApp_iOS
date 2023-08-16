//
//  AppUrl.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 5.08.2023.
//

import Foundation

struct APPURL {
    struct Domains {
        static let Url = "http://node-api.eu-central-1.elasticbeanstalk.com"
    }

    struct Routes {
        static let Api = ""
    }

    static let Domain = Domains.Url
    static let Route = Routes.Api
    static let BaseURL = Domain + Route
}
