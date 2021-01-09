//
//  UserModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI
import Combine

struct UserModel: Identifiable, Codable {
    let id = UUID()
    var role, firstName, lastName, sport, gender,  dateOfBirth, email, password, roleOrCreatedBy: String?
}
