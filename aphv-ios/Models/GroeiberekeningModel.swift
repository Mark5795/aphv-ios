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
    var dateOfBirth, gender, dateOfMeasurement : String?
    var weight, sittingHeight, standingHeight : Double?
}
