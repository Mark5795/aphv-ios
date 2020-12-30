//
//  MainView.swift
//  aphv-ios
//
//  Created by Mark Kea on 17/12/2020.
//

import SwiftUI

struct MainView: View {
    
    var firstTime : Bool = false
    var introPagerView = IntroPagerView()

    init() {
        checkFirstTime()
    }
    
    func checkFirstTime() {
        if (firstTime) {
            AnyView(introPagerView)
        }
    }

    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
