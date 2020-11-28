//
//  GetUsersResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 27/11/2020.
//

import SwiftUI

struct GetUsersResponse: Decodable {
    let email: String
    let firstName: String
    let lastName: String
    let accountType: String
    
    public enum CodingKeys: String, CodingKey {
        case email
        case firstName
        case lastName
        case accountType
    }
}
