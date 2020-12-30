//
//  LoginResponse.swift
//  aphv-ios
//
//  Created by Mark Kea on 29/12/2020.
//

import Foundation

struct LoginResponse: Decodable {
    let accessToken, refreshToken : String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
    }
}
