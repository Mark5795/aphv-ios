//
//  GebruikerViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 24/11/2020.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {

//    var checkedConditions : Bool = false
//    var checkedApproval : Bool = false
    
    @Published var userModel : UserModel
    
    @Published var alertTitle : String = "Error"
    @Published var alertMessage : String = "Error"
    @Published var alertSucces : Bool = false
    
    @Published var role: String = "Sporter"
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var sport: String = ""
    @Published var gender : String = ""
    @Published var dateOfBirth: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordCheck: String = ""
    @Published var roleOrCreatedBy : String = ""
    
    @Published var checkedConditions: Bool = false
    @Published var checkedApproval: Bool = false
    
    
    init(userModel : UserModel) {
        self.userModel = userModel
    }
    
    func updateRegisterUserModel(role : String, firstName : String, lastName : String, sport : String, gender : String, dateOfBirth : String, email : String, password : String, roleOrCreatedBy : String) {

        userModel.role = role
        userModel.firstName = firstName
        userModel.lastName = lastName
        userModel.sport = sport
        userModel.gender = gender
        userModel.dateOfBirth = dateOfBirth
        userModel.email = email
        userModel.password = password
        userModel.roleOrCreatedBy = roleOrCreatedBy
    }

    func updateLoginUserModel(email : String, password : String)
    {
        userModel.email = email
        userModel.password = password
    }
    
    func sendLoginUserRequest() {
        updateLoginUserModel(email: email, password: password)
        LoginService.shared.Login(userModel: userModel) { (result) in
            switch result {
            case .success(_):
                self.alertTitle = "Inloggen gelukt!"
                self.alertMessage = ""
                self.alertSucces = true
            case .failure(_):
                self.alertTitle = "Inloggen mislukt"
                self.alertMessage = "Het inloggen is mislukt, heb je een goede wifi verbinding? Probeer het nog een keer."
            }
        }
    }
    
    func checkConditions() -> Bool {
        if (checkUserInput() == false) {
            alertTitle = "Verplichte velden"
            alertMessage = "Er mogen geen velden leeg gelaten worden."
            return false
        }
        if (checkCheckedConditions() == false) {
            alertTitle = "Voorwaarden accepteren"
            alertMessage = "De voorwaarden moet worden geaccepteerd voor het aanmaken van een account."
            return false
        }
        if (checkCheckedApproval() == false) {
            alertTitle = "Goedkeuring persoonsgegevens"
            alertMessage = "Voor het aanmaken van een account moet je goedkeuring hebben van een ouder, voogd of coach of je bent 18 jaar of ouder."
            return false
        }
        if (checkPasswordMatch() == false) {
            alertTitle = "Wachtwoorden ongelijk"
            alertMessage = "De ingevoerde wachtwoorden zijn niet het zelfde."
            return false
        }
        return true
    }
    
    func checkUserInput() -> Bool {
        if (userModel.role == "" || userModel.firstName == "" || userModel.lastName == "" || userModel.sport == "" || userModel.gender == "" || userModel.dateOfBirth == "" || userModel.email == "" || userModel.password == "") {
            return false
        }
        return true
    }
    
    func checkCheckedConditions() -> Bool {
        if(checkedConditions) {
            return true
        }
        return false
    }
    
    func checkCheckedApproval() -> Bool {
        if(checkedApproval) {
            return true
        }
        return false
    }
    
    func checkPasswordMatch() -> Bool {
        if(passwordCheck == userModel.password) {
            return true
        }
        return false
    }
    
    func sendRegisterUserRequest() {
        updateRegisterUserModel(role: role, firstName: firstName, lastName: lastName, sport: sport, gender: gender, dateOfBirth: dateOfBirth, email: email, password: password, roleOrCreatedBy: roleOrCreatedBy)
        if (checkConditions()) {
            RegisterService.shared.Register(userModel: userModel) { (result) in
                switch result {
                case .success(_):
                    self.alertTitle = "Je account is aangemaakt!"
                    self.alertMessage = "Druk op de bevestigingslink in je email om je account te activeren."
                    self.alertSucces = true
                case .failure(_):
                    self.alertTitle = "Registreren Mislukt"
                    self.alertMessage = "Het registreren is mislukt, heb je een goede wifi verbinding? Probeer het nog een keer."
                }
            }
        }
    }
}
