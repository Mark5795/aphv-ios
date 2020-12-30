//
//  LoginRequest.swift
//  aphv-ios
//
//  Created by Mark Kea on 29/12/2020.
//

import Foundation

struct LoginRequest : Encodable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
    }
}
