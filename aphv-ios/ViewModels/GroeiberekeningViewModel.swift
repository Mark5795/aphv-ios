//
//  GroeiberekeningViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//

import SwiftUI
import Combine

class GroeiberekeningViewModel: ObservableObject {
    
    @Published var groeiberekeningModel = GroeiberekeningModel()
    
    @Published var dateOfBirth: String = ""
    @Published var gender: String = ""
    @Published var dateOfMeasurement: String = ""
    @Published var weight: Double = 0
    @Published var sittingHeight : Double = 0
    @Published var standingHeight : Double = 0
    
    init(groeiberekeningModel : GroeiberekeningModel) {
        self.groeiberekeningModel = groeiberekeningModel
    }
    
    func updateWithouAccountGroeiberekeningModel(dateOfBirth : String, gender : String, dateOfMeasurement : String, weight : Double, sittingHeight : Double, standingHeight : Double) {

        groeiberekeningModel.dateOfBirth = dateOfBirth
        groeiberekeningModel.gender = gender
        groeiberekeningModel.dateOfMeasurement = dateOfMeasurement
        groeiberekeningModel.weight = weight
        groeiberekeningModel.sittingHeight = sittingHeight
        groeiberekeningModel.standingHeight = standingHeight
    }
    
    func getDate() -> String {
        let now = Date()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")

        let datetime = formatter.string(from: now)
        print(datetime)
        return datetime
    }
    
    
}
