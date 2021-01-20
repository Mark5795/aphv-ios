//
//  SportersPage.swift
//  aphv-ios
//
//  Created by Mark Kea on 20/01/2021.
//

import SwiftUI


// Show list of sporters who want to add the coach
// Show list of sporters that are connected with the coach
// Show QR code for connecting with a sporter

struct SportersPage: View {
    
    let localStorage = LocalStorage()
    
    var body: some View {
        ZStack {
            TopCurve(title: "Sporters")
                .zIndex(1.0)
//            ScrollView {
                    VStack {
                        // link to QR code
                        
                        
                        // If there are invites show list of invites
                        Text("Deze personen willen je toevoegen")
                                                
                        //list of added sporters
                        Text("Contacten")
                        
                        Spacer()
                        
                        // QR code that sporters can scan
                        Text("Voeg nieuwe sporter toe")
                        Text("Laat deze QR code scannen")
                            .fontWeight(.light)
                        ModalBarcodeGenerator(dataString: localStorage.emailUser)
                }
//            }
        }
    }
}

struct SportersPage_Previews: PreviewProvider {
    static var previews: some View {
        SportersPage()
    }
}
