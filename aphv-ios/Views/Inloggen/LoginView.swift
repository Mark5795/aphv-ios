//
//  LoginView.swift
//  aphv-ios
//
//  Created by Mark Kea on 25/11/2020.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack() {
                ZStack() {
                    TopCurve(title: "Aanmelden")
                    
                }
                .navigationTitle(Text(""))
                .zIndex(0)
                
                VStack(alignment: .leading) {
                    
                    Text("Voornaam")
//                    SecureField()
//                        .padding()
//                        .background(Color.InputFieldLightGrey)
//                        .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(.horizontal, 25.0)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
