//
//  aphv_iosApp.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/11/2020.
//

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
    
    var createdAccount: Bool {
        get {
            return userDefaults.bool(forKey: "createdAccount")
        }
        set {
            userDefaults.set(newValue, forKey: "createdAccount")
        }
    }
}

@main
struct aphv_iosApp: App {
    let localStorage = LocalStorage()
    
    var body: some Scene {
        WindowGroup {
            if(localStorage.createdAccount) {
                HomeSporter()
            }
            if (localStorage.hasSeenIntro) {
                LandingPage()
            } else {
                IntroPagerView()
            }
        }
    }
}
