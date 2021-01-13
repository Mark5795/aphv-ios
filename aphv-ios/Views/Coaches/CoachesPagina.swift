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
    @State var coaches : [CoachModel] = []
    
    @State var showingErrorAlert: Bool = false
    @State var showingSuccesAlert: Bool = false
    
    init() {
        sporterToCoachesViewModel.GetListOfCoaches()
    }
    
    var body: some View {
        ZStack {
            TopCurve(title: "Coaches")
            VStack {
                
                Text("Coaches")
                                
                if(coaches.isEmpty) {
                    Text("Je hebt nog geen coaches toegevoegd.")
                        .padding(.bottom, 40.0)
                }
                
                List(coaches) { coach in
                    VStack(alignment: .leading) {
                        Text(coach.firstName + " " + coach.lastName)
                        Text(coach.roleOrSport)
                        Text(coach.email)
                    }
                    .padding(.horizontal, 50.0)
                    .background(Color.ASMgreen)

                }
                .onAppear {
                    coaches = sporterToCoachesViewModel.coaches
                }
                
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
            .padding(.top, 75.0)
        }
    }
}

struct CoachesPagina_Previews: PreviewProvider {
    static var previews: some View {
        CoachesPagina()
    }
}
