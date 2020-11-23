//
//  Data.swift
//  aphv-ios
//
//  Created by Mark Kea on 20/11/2020.
//

import SwiftUI

struct Data {
    static let activityItems = [
        ResultaatItem(title: "persoonlijk", color: Color.purple, imageName: "figure.persoonlijk", imageRoataion: 0, progress: 0.5),
        ResultaatItem(title: "gemiddeld", color: Color.blue, imageName: "figure.persoonlijk", imageRoataion: 90, progress: 0.75)
    ]
    
    static let valueItems = [
        ValueItem(title: "persoonlijk", imageName: "figure.persoonlijk", value: 564, selected: true, imageColor: Color.purple, imageRotation: 0, grafiekData: groeiDataPersoonlijk),
        ValueItem(title: "gemiddeld", imageName: "figure.persoonlijk", value: 293, selected: false, imageColor: Color.blue, imageRotation: 90, grafiekData: groeiDataGemiddeld)
    ]

    static let groeiDataPersoonlijk = [
        GroeiberekeningResultaatData(leeftijd: 8, waarde: 4),
        GroeiberekeningResultaatData(leeftijd: 10, waarde: 4),
        GroeiberekeningResultaatData(leeftijd: 12, waarde: 5),
        GroeiberekeningResultaatData(leeftijd: 14, waarde: 7),
        GroeiberekeningResultaatData(leeftijd: 16, waarde: 3),
        GroeiberekeningResultaatData(leeftijd: 18, waarde: 2)
    ]

    static let groeiDataGemiddeld = [
        GroeiberekeningResultaatData(leeftijd: 8, waarde: 4.4),
        GroeiberekeningResultaatData(leeftijd: 10, waarde: 4.3),
        GroeiberekeningResultaatData(leeftijd: 12, waarde: 4.2),
        GroeiberekeningResultaatData(leeftijd: 14, waarde: 7),
        GroeiberekeningResultaatData(leeftijd: 16, waarde: 7),
        GroeiberekeningResultaatData(leeftijd: 18, waarde: 2)
    ]
}
