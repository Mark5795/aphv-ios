//
//  MainView.swift
//  aphv-ios
//
//  Created by Mark Kea on 17/12/2020.
//

import SwiftUI

struct MainView: View {
    @State var isMainPresented: Bool = false
    
    var firstTime : Bool = false

    init() {
        checkFirstTime()
    }
    
    func checkFirstTime() {
        if (firstTime) {

            
        }
    }

    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
