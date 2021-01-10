//
//  RegisterCoachResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import Foundation

struct RegisterCoachResponse: Decodable {
    let email, firstName, lastName, password, role: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case password = "password"
        case role = "role"
    }
}
