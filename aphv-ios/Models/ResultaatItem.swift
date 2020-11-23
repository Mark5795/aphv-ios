//
//  ResultaatItem.swift
//  aphv-ios
//
//  Created by Mark Kea on 20/11/2020.
//

import SwiftUI

struct ResultaatItem: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let imageName: String
    let imageRoataion: Double
    let progress: CGFloat
}
