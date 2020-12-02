//
//  RegistreerRequest.swift
//  aphv-ios
//
//  Created by Mark Kea on 26/11/2020.
//

import Foundation

struct RegisterRequest: Encodable {
    let email: String
    let firstName: String
    let lastName: String
    let password: String
    let dateOfBirth: String
    let gender: String
    let sport: String
//    
//    enum CodingKeys: String, CodingKey {
//        case email = "email"
//        case firstName = "firstName"
//        case lastName = "lastName"
//        case password = "password"
//        case dateOfBirth = "dateOfBirth"
//        case gender = "gender"
//        case sport = "sport"
//    }
}
