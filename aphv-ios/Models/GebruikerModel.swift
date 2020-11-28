//
//  UserModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct GebruikerModel: Codable {
    let Id = UUID()
    let Rol: Bool
    let Voornaam: String
    let Achternaam: String
    let Sport: String
    let Geslacht: String
    let Geboortedatum: String
    let Email: String
    let Wachtwoord: String
}
