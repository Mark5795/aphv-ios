//
//  HomeSporter.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//

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
