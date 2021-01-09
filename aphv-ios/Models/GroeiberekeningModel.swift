//
//  GroeiberekeningModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//

import SwiftUI
import Combine

struct GroeiberekeningModel: Identifiable, Codable {
    let id = UUID()
    var dateOfBirth, gender, dateOfMeasurement, email, date, createdBy, growthPhase : String?
    var weight, sittingHeight, standingHeight, age, phv, aphv  : Double?
    
}
