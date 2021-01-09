//
//  GroeiberekeningResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//

import Foundation

struct GroeiberekeningResponse: Decodable {
    
    let email, date, createdBy, growthPhase : String
    let age, phv, aphv : Double

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case date = "date"
        case createdBy = "createdBy"
        case age = "age"
        case phv = "phv"
        case aphv = "aphv"
        case growthPhase = "growthPhase"
    }
}
