//
//  GetCoachesResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import Foundation

struct CoachModel : Codable, Identifiable, Hashable {
    let id = UUID()
    let email, firstName, lastName, roleOrSport : String?
    let accepted : Bool?
        
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case roleOrSport = "roleOrSport"
        case accepted = "accepted"
    }
}
