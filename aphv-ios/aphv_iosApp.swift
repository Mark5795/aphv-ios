//
//  aphv_iosApp.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/11/2020.
//


// if users starts the app for the first time, show the intro
// else if the users doesn't have a account show landingpage
// else if the user have a account show loginpage

import SwiftUI

class LocalStorage {
    let userDefaults = UserDefaults.standard
    
    
    var hasSeenIntro: Bool {
        get {
            return userDefaults.bool(forKey: "seenIntro")
        }
        set {
            userDefaults.set(newValue, forKey: "seenIntro")
        }
    }
    
    var isLoggedIn: Bool {
        get {
            return userDefaults.bool(forKey: "loggedIn")
        }
        set {
            userDefaults.set(newValue, forKey: "loggedIn")
        }
    }
    
    var emailUser: String {
        get {
            return userDefaults.string(forKey: "emailU") ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: "emailU")
        }
    }
}

@main
struct aphv_iosApp: App {
    let localStorage = LocalStorage()
    
    var body: some Scene {
        WindowGroup {
            if(localStorage.isLoggedIn) {
                LoginView()
                
//                To test AlextX
//                TestLoginView()
            } else{
                if (localStorage.hasSeenIntro) {
                    LandingPage()
                } else {
                    IntroPagerView()
                }
            }
        }
    }
}
