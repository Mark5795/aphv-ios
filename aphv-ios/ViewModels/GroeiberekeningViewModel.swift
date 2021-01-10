//
//  GroeiberekeningViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//

import SwiftUI
import Combine

class GroeiberekeningViewModel: ObservableObject {
    
    var groeiberekeningModel : GroeiberekeningModel
    
    
    @Published var alertTitle : String = "Error"
    @Published var alertMessage : String = "Error"
    @Published var alertSucces : Bool = false
    
    @Published var dateOfBirth: String = ""
    @Published var gender: String = ""
    @Published var dateOfMeasurement: String = ""
    @Published var weight: Double = 0
    @Published var sittingHeight : Double = 0
    @Published var standingHeight : Double = 0
    
    @Published var email : String = ""
    @Published var date : String = ""
    @Published var createdBy : String = ""
    @Published var age : Double = 0
    @Published var phv : Double = 0
    @Published var aphv : Double = 0
    @Published var growthPhase : String = ""
    
    
    init(groeiberekeningModel : GroeiberekeningModel) {
        self.groeiberekeningModel = groeiberekeningModel
    }
    
    func updateWithoutAccountGroeiberekeningModel(dateOfBirth : String, gender : String, dateOfMeasurement : String, weight : Double, sittingHeight : Double, standingHeight : Double) {

        groeiberekeningModel.dateOfBirth = dateOfBirth
        groeiberekeningModel.gender = gender
        groeiberekeningModel.dateOfMeasurement = dateOfMeasurement
        groeiberekeningModel.weight = weight
        groeiberekeningModel.sittingHeight = sittingHeight
        groeiberekeningModel.standingHeight = standingHeight
    }
    
    func sendGroeiberekeningRequest() {
        updateWithoutAccountGroeiberekeningModel(dateOfBirth: dateOfBirth, gender: gender, dateOfMeasurement: getDate(), weight: weight, sittingHeight: sittingHeight, standingHeight: standingHeight)
            if (checkConditions()) {
                GroeiberekeningService.shared.GroeiberekeningWithoutAccount(groeiberekeningModel: groeiberekeningModel) { (result) in
                    switch result {
                    case .success(let response):
                        self.phv = response.phv
                        self.growthPhase = response.growthPhase
                        self.alertTitle = "Je groei word berekend!"
                        self.alertMessage = ""
                        self.alertSucces = true
                    case .failure(_):
                        self.alertTitle = "Berekening Mislukt"
                        self.alertMessage = "Het berekenen is mislukt, heb je een goede wifi verbinding? Probeer het nog een keer."
                    }
                }
            }
        }
    
    func checkConditions() -> Bool {
        if (checkUserInput() == false) {
            alertTitle = "Verplichte velden"
            alertMessage = "Er mogen geen velden leeg gelaten worden."
            return false
        }
        return true
    }
    
    func checkUserInput() -> Bool {
        if (groeiberekeningModel.dateOfBirth == "" || groeiberekeningModel.gender == "" || groeiberekeningModel.dateOfMeasurement == "" || groeiberekeningModel.weight == 0 || groeiberekeningModel.sittingHeight == 0 || groeiberekeningModel.standingHeight == 0) {
            return false
        }
        return true
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
