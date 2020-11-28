//
//  ValueItem.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct ValueItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let value: Int
    var selected: Bool
    let imageColor: Color
    let imageRotation: Double
    var grafiekData: [GroeiberekeningResultaatData]
}
