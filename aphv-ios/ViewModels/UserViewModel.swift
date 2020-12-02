//
//  GebruikerViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 24/11/2020.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    
    @Published var passwordCheck : String = ""
    @Published var userModel : UserModel
    
    init(userModel : UserModel) {
        self.userModel = userModel
    }
    

    
//    func checkPasswordMatch() -> Bool {
//    if(passwordCheck == UserModel.password) {
//            return true
//        }
//        return false
//    }
//
//    func RegisterUser() -> Void {
//        if (checkPasswordMatch() == true) {
//            RegisterService.Register(UserModel)
//        }
//    }
    
    func registerUser() {
        RegisterService.shared.Register(userModel: userModel) { (result) in
            switch result {
            case .success(let response):
                print("gelukt", response)
            case .failure(_):
                print("Mislukt")
            }
        }
    }
}
