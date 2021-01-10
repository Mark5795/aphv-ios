//
//  GroeiberekenigRequest.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//

import Foundation

struct GroeiberekeningRequest: Encodable {
    let dateOfBirth, gender, dateOfMeasurement: String
    let weight, sittingHeight, standingHeight : Double
}

struct GroeiberekeningWithAccountRequest: Encodable {
    let dateOfMeasurement: String?
    let weight, sittingHeight, standingHeight : Double?
}
