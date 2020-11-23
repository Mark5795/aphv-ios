//
//  RegistreerSporterView.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct RegistreerSporterView: View {
    
    @State var voornaam: String = ""
    @State var password: String = ""
    @State var isTryingToLogin: Bool = false
    @State var isRequestErrorViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack() {
                ZStack() {
                    TopCurve(title: "Account aanmaken")
                    
                }
                .navigationTitle(Text(""))
                .zIndex(0)
                
                VStack(alignment: .leading) {
                    Text("Kies je rol")
                    HStack {
                        RadioButtonGroups { selected in
                            print("Selected Gender is: \(selected)")
                        }
                    }
                    .padding()
                    .background(Color.InputFieldLightGrey)
                    .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                    Text("Voornaam")
                    TextField("", text: )
                        .padding()
                        .background(Color.InputFieldLightGrey)
                        .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(.horizontal, 25.0)
            }
        }
    }
}

struct RegistreerSporterView_Previews: PreviewProvider {
    static var previews: some View {
        RegistreerSporterView()
    }
}
