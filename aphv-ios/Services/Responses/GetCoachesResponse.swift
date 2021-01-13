//
//  GetCoachesResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import Foundation

struct GetCoachesResponse: Decodable {
    
    let coaches: [UserModel]
    
//    let email, firstName, lastName, roleOrSport, accepted: String
//
//    enum CodingKeys: String, CodingKey {
//        case email = "email"
//        case firstName = "firstName"
//        case lastName = "lastName"
//        case roleOrSport = "roleOrSport"
//        case accepted = "accepted"
//    }
}
