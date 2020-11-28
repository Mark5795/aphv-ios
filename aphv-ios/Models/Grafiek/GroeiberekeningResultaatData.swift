//
//  GroeiBerekeningResultaatData.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct GroeiberekeningResultaatData: Identifiable {
    let id = UUID()
    let leeftijd: Int
    let waarde: CGFloat
    var selected = false
}
