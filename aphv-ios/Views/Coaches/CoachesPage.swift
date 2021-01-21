//
//  TestCoachPage.swift
//  aphv-ios
//
//  Created by Mark Kea on 15/01/2021.
//

import SwiftUI

// With the QR code scanner button a QR code can be scanned
// This QR code is the email of a coach
// Add this coach by this email
// Show the coaches in a list.

struct CoachesPage: View {
    
    @ObservedObject var sporterToCoachesViewModel = SporterToCoachesViewModel(userModel: UserModel())
    
    var body: some View {
        ZStack {
            TopCurve(title: "Coaches")
                .zIndex(1.0)
            VStack {
                if(sporterToCoachesViewModel.coaches == []) {
                    Text("Je hebt nog geen coaches toegevoegd.")
                }
                
                    List(sporterToCoachesViewModel.coaches) { coach in
                        VStack(alignment: .leading) {
                            HStack{
                                Text(coach.firstName ?? "")
                                    .fontWeight(.medium)
                                    .font(.system(size: 18))
                                
                                Spacer()
                                
                                Button(action: {sporterToCoachesViewModel.DeleteSporterToCoach(emailCoach: coach.email ?? "")}, label: {
                                    Image("IconCross")
                                })
                            }
                            .padding(.leading)
                            
                            Group {
                                HStack{
                                    Text(coach.roleOrSport ?? "")
                                        .fontWeight(.medium)
                                        .font(.system(size: 16))
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                                
                                HStack{
                                    Text(coach.email ?? "")
                                        .fontWeight(.medium)
                                        .font(.system(size: 16))
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .frame(width: 275.0)
                        .background(Color.ASMlighterGreen)
                        .cornerRadius(8.0)
                    }
                    .onAppear {
                        sporterToCoachesViewModel.GetListOfCoaches()
                    }
                

                
                
                Text("Voeg een nieuwe coach toe.")
                    .padding(.bottom, 40.0)
                
                NavigationLink(
                    destination: QRcodeScanner(),
                    label: {
                        Text("Open QR code scanner")
                            .fontWeight(.bold)
                            .frame(maxWidth: 275, minHeight: 44)
                            .foregroundColor(Color.ASMgreen)
                    })
                    .isDetailLink(false)
                    .border(Color.ASMgreen, width: 3)
                    .cornerRadius(8.0)
            }
        }
    }
}

struct CoachesPage_Previews: PreviewProvider {
    static var previews: some View {
        CoachesPage()
    }
}
