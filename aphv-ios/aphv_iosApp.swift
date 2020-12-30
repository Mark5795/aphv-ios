//
//  aphv_iosApp.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/11/2020.
//

import SwiftUI

@main
struct aphv_iosApp: App {
        
    var firstTime : Bool = true
    var loggedIn : Bool = false
    var introPagerView = IntroPagerView()
    var homeSporter = HomeSporter()
    var mainPagerView = MainPagerView()

    func decideWhichView() -> some View {
        if (loggedIn) {
            return AnyView(homeSporter)
        }
        if (firstTime) {
            return AnyView(introPagerView)
        }
        else {
            return AnyView(mainPagerView)
        }
    }
    
    var body: some Scene {
        WindowGroup {
//            decideWhichView()
            LoginView()
        }
    }
}
