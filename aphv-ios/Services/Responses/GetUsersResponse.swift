//
//  GetUsersResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 27/11/2020.
//

import Foundation

struct GetUsersResponse: Decodable {
    let email, firstName, lastName, dateOfBirth, gender, dateOfLastMeasurement, lastGrowthPhase, sport, role: String?
    let lastPhv, lastAphv: Double?
    
    public enum CodingKeys: String, CodingKey {
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case dateOfBirth = "dateOfBirth"
        case gender = "gender"
        case dateOfLastMeasurement = "dateOfLastMeasurement"
        case lastPhv = "lastPhv"
        case lastAphv = "lastAphv"
        case lastGrowthPhase = "lastGrowthPhase"
        case sport = "sport"
        case role = "role"
    }
}
