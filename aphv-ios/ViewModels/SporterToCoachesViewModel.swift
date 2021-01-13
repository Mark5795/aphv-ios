//
//  SporterToCoachesViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import SwiftUI
import Combine

class SporterToCoachesViewModel: ObservableObject {
    
    @Published var userModel : UserModel
    let localStorage = LocalStorage()
    let userViewModel = UserViewModel(userModel: UserModel())
    
    @State var coaches: [UserModel] = []
    
    @Published var alertTitle : String = "Error"
    @Published var alertMessage : String = "Error"
    @Published var alertSucces : Bool = false
    
    @Published var email: String = ""
    
    init(userModel : UserModel) {
        self.userModel = userModel
    }
    
    func AddCoach(emailCoach: String) {
        SporterToCoachesService.shared.AddCoach(emailCoach: emailCoach, emailUser: localStorage.emailUser, accessToken: userViewModel.accessToken ?? "") { (result) in
            switch result {
            case .success(let response):
                self.alertTitle = "Toevoegen gelukt!"
                //                self.alertMessage = ""
                self.alertSucces = true
            case .failure(_):
                self.alertTitle = "Toevoegen mislukt"
            //                self.alertMessage = "Het inloggen is mislukt, heb je een goede wifi verbinding? Probeer het nog een keer."
            }
        }
    }
    
    func GetListOfCoaches() -> Bool{
        //        updateLoginUserModel(email: email, accessToken, accessToken)
        SporterToCoachesService.shared.GetListOfCoaches(emailUser: localStorage.emailUser, accessToken: userViewModel.accessToken ?? "") { (result) in
            switch result {
            case .success(let response):
                self.coaches = response
                self.alertTitle = "Toevoegen gelukt!"
                //                self.alertMessage = ""
                self.alertSucces = true
            case .failure(_):
                self.alertTitle = "Toevoegen mislukt"
            //                self.alertMessage = "Het inloggen is mislukt, heb je een goede wifi verbinding? Probeer het nog een keer."
            }
        }
        return true
    }
}
