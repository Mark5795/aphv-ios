//
//  RegisterCoachRequest.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import Foundation

struct RegisterCoachRequest: Encodable {
    let email: String
    let firstName: String
    let lastName: String
    let password: String
    let role: String
}
