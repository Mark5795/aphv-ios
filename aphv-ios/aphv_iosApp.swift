//
//  aphv_iosApp.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/11/2020.
//

import SwiftUI

class LocalStorage {
    let userDefaults = UserDefaults.standard
    
    var hasSeenOnboarding: Bool {
        get {
            return userDefaults.bool(forKey: "onboarding")
        }
        set {
            userDefaults.set(newValue, forKey: "onboarding")
        }
    }
}

@main
struct aphv_iosApp: App {
        
    var firstTime : Bool = true
    var loggedIn : Bool = false
    var introPagerView = IntroPagerView()
    

    
    var body: some Scene {
        WindowGroup {
            if(loggedIn) {
                HomeSporter()
            }
            if (firstTime) {
//                AnyView(introPagerView)
                LandingPage()
            } else {
                LandingPage()
            }
        }
    }
}
