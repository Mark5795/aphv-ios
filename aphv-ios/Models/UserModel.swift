//
//  UserModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID()
    let Rol: Bool
    let Voornaam: String
    let Achternaam: String
    let Sport: String
    let Geslacht: Bool
    let Geboortedatum: Int
    let Emailadres: String
    let wachtwoord: String
}
