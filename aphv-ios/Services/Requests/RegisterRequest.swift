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
}
