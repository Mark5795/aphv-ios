//
//  RegistreerResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 26/11/2020.
//

import Foundation

struct RegisterUserResponse: Decodable {
    let email, firstName, lastName, password, dateOfBirth, gender, sport: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case password = "password"
        case dateOfBirth = "dateOfBirth"
        case gender = "gender"
        case sport = "sport"
    }
}
