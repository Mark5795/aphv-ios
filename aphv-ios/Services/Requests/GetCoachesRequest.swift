//
//  GetCoachesRequest.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import Foundation

struct GetCoachesRequest: Encodable {
    let email: String
    let authorization: String
}
