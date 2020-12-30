//
//  RequestError.swift
//  aphv-ios
//
//  Created by Mark Kea on 29/12/2020.
//

import Foundation

enum RequestError: Error {
    case urlError(URLError)
    case decodingError(DecodingError)
    case genericError(Error)
}
