//
//  CoachesPagina.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//

import SwiftUI

// With the QR code scanner button a QR code can be scanned
// This QR code is the email of a coach
// Add this coach by this email
// Show the coaches in a list.

struct CoachesPagina: View {
    
    @ObservedObject var sporterToCoachesViewModel = SporterToCoachesViewModel(userModel: UserModel())
    
    @State private var isShowingScanner = false
    @State var coaches: [UserModel] = []
    
    var body: some View {
        ZStack {
            TopCurve(title: "Coaches")
            VStack {
                
//                Button(action: {sporterToCoachesViewModel.GetListOfCoaches()}, label: {
//                    Text("Button")
//                })
//                
//                if(!sporterToCoachesViewModel.coaches.isEmpty) {
//                    Text(sporterToCoachesViewModel.coaches[0].firstName ?? "")
//                }
                

                
//                List(sporterToCoachesViewModel.coaches) { coach in
//                    Text(coach.firstName ?? "")
//                }
                
                Text("Coaches")
                    .padding(.bottom, 40.0)
                
                Text("Je hebt nog geen coaches toegevoegd.")
                    .padding(.bottom, 40.0)
                
                Text("Voeg een nieuwe coach toe.")
                    .padding(.bottom, 40.0)
                
                NavigationLink(
                    destination: QRcodeScanner(),
                    label: {
                        Text("Open QR code scanner")
                            .fontWeight(.bold)
                            .frame(maxWidth: 325, minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .isDetailLink(false)
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
            }
        }
    }
}

struct CoachesPagina_Previews: PreviewProvider {
    static var previews: some View {
        CoachesPagina()
    }
}
