//
//  HomeSporter.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//


// Check if sporter got coaches

// if sporter does not have coaches, show text and start groeiberekening button

// else show date next meting, pager with calculations and pager with results. and start groeiberekenig button

// navbar on bottom

import SwiftUI

struct HomeSporter: View {
    @State var isMainPresented: Bool = false
//    let localStorage = LocalStorage()
    
    var body: some View {
        NavigationView {
            Button("start intro") {
                self.isMainPresented = true
            }
            .fullScreenCover(isPresented: $isMainPresented) {
                LandingPage()
            }
        }
    }
}

struct HomeSporter_Previews: PreviewProvider {
    static var previews: some View {
        HomeSporter()
    }
}
