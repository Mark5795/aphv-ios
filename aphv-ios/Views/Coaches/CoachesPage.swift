//
//  CoachesPagina.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//

import SwiftUI
import AlertX

// With the QR code scanner button a QR code can be scanned
// This QR code is the email of a coach
// Add this coach by this email
// Show the coaches in a list.

struct CoachesPage: View {
    
//    @ObservedObject var sporterToCoachesViewModel = SporterToCoachesViewModel(userModel: UserModel())
//    @State var coaches : [CoachModel] = []
    
    @State var coaches : [CoachModel] = [CoachModel(email: "kees@gmail.com", firstName: "kees", lastName: "tol", roleOrSport: "Tennis", accepted: false),
        CoachModel(email: "dennis@gmail.com", firstName: "dennis", lastName: "Haak", roleOrSport: "Voetbal", accepted: false)]
    
//    @State var showingErrorAlert: Bool = false
//    @State var showingSuccesAlert: Bool = false
    @State var showAlertX: Bool = false
//    @State var showAlertX_preview: Bool = false
    
//    init() {
//        sporterToCoachesViewModel.GetListOfCoaches()
//    }
    
    var body: some View {
        List(coaches) { coach in
            VStack(alignment: .leading) {
                HStack{
                    Text(coach.firstName)
                        .fontWeight(.medium)
                        .font(.system(size: 18))
                    Spacer()
                    Button(action: {self.showAlertX.toggle()}, label: {
                        Image("IconCross")
                    })
                }
                .padding(.leading)
                
                HStack{
                    Text(coach.roleOrSport)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding(.leading)
                
                HStack{
                    Text(coach.email)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding(.leading)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .frame(width: 275.0)
            .background(Color.green)
            .cornerRadius(8.0)
            
        }
//        .onAppear {
//            coaches = sporterToCoachesViewModel.coaches
//        }
        
        .alertX(isPresented: $showAlertX, content: {
            AlertX(title: Text("Wil je de coach verwijderen?")
                    .fontWeight(.medium)
                    .font(.system(size: 18)),
                   primaryButton: .default(Text("Ja"), action: {
                    print("delete coach")
                   }),
                   secondaryButton: .cancel(Text("Nee")),
                   theme: .custom(windowColor: Color.green,
                                  alertTextColor: Color.white,
                                  enableShadow: true,
                                  enableRoundedCorners: true,
                                  enableTransparency: true,
                                  cancelButtonColor: Color.white,
                                  cancelButtonTextColor: Color.green,
                                  defaultButtonColor: Color.white,
                                  defaultButtonTextColor: Color.green),
                   animation: .classicEffect()
            )
        })
//        ZStack {
//            TopCurve(title: "Coaches")
//            VStack {
                
//                Text("Coaches")
                
//                if(coaches.isEmpty) {
//                    Text("Je hebt nog geen coaches toegevoegd.")
//                        .padding(.bottom, 40.0)
//                }
                
//                List(coaches) { coach in
//                    VStack(alignment: .leading) {
//                        Text(coach.firstName + " " + coach.lastName)
//                        Text(coach.roleOrSport)
//                        Text(coach.email)
//                    }
//                    .padding(.horizontal, 50.0)
//                    .background(Color.ASMlightGreen)
//
//                }
//                .onAppear {
//                    coaches = sporterToCoachesViewModel.coaches
//                }
//                List(coaches) { coach in
//                    VStack(alignment: .leading) {
//                        HStack{
//                            Text(coach.firstName)
//                                .fontWeight(.medium)
//                                .font(.system(size: 18))
//                            Spacer()
//                            Button(action: {self.showAlertX.toggle()}, label: {
//                                Image("IconCross")
//                            })
//                        }
//                        .padding(.leading)
//                        
//                        HStack{
//                            Text(coach.roleOrSport)
//                                .fontWeight(.medium)
//                                .font(.system(size: 16))
//                            Spacer()
//                        }
//                        .padding(.leading)
//                        
//                        HStack{
//                            Text(coach.email)
//                                .fontWeight(.medium)
//                                .font(.system(size: 16))
//                            Spacer()
//                        }
//                        .padding(.leading)
//                    }
//                    .padding(.horizontal, 10)
//                    .padding(.vertical, 15)
//                    .frame(width: 275.0)
//                    .background(Color.green)
//                    .cornerRadius(8.0)
//                    
//                }
//                .alertX(isPresented: $showAlertX, content: {
//                    AlertX(title: Text("Wil je de coach verwijderen?")
//                            .fontWeight(.medium)
//                            .font(.system(size: 18)),
//                           primaryButton: .default(Text("Ja"), action: {
//                            print("delete coach")
//                           }),
//                           secondaryButton: .cancel(Text("Nee")),
//                           theme: .custom(windowColor: Color.green,
//                                          alertTextColor: Color.white,
//                                          enableShadow: true,
//                                          enableRoundedCorners: true,
//                                          enableTransparency: true,
//                                          cancelButtonColor: Color.white,
//                                          cancelButtonTextColor: Color.green,
//                                          defaultButtonColor: Color.white,
//                                          defaultButtonTextColor: Color.green),
//                           animation: .classicEffect()
//                    )
//                })
//                .onAppear {
//                    coaches = sporterToCoachesViewModel.coaches
//                }
                
//                VStack(alignment: .leading) {
//                    HStack{
//                        Text("Mark Kea")
//                            .fontWeight(.medium)
//                            .font(.system(size: 18))
//                        Spacer()
//                        Button(action: {self.showAlertX_preview = true}, label: {
//                            Image("IconCross")
//                        }).alertX(isPresented: $showAlertX, content: {
//                            AlertX(title: Text("Wil je de coach verwijderen?")
//                                    .fontWeight(.medium)
//                                    .font(.system(size: 18)),
//                                   primaryButton: .default(Text("Ja"), action: {
//                                    print("delete coach")
//                                   }),
//                                   secondaryButton: .cancel(Text("Nee")),
//                                   theme: .custom(windowColor: Color.ASMgreen,
//                                                  alertTextColor: Color.white,
//                                                  enableShadow: true,
//                                                  enableRoundedCorners: true,
//                                                  enableTransparency: true,
//                                                  cancelButtonColor: Color.white,
//                                                  cancelButtonTextColor: Color.ASMdarkGreen,
//                                                  defaultButtonColor: Color.white,
//                                                  defaultButtonTextColor: Color.ASMdarkGreen),
//                                   animation: .classicEffect()
//                            )
//                        })
//                    }
//                    .padding(.leading)
//
//                    HStack{
//                        Text("Tennis")
//                            .fontWeight(.medium)
//                            .font(.system(size: 16))
//                        Spacer()
//                    }
//                    .padding(.leading)
//
//                    HStack{
//                        Text("markmark@gmail.com")
//                            .fontWeight(.medium)
//                            .font(.system(size: 16))
//                        Spacer()
//                    }
//                    .padding(.leading)
//                }
//                .padding(.horizontal, 10)
//                .padding(.vertical, 15)
//                .frame(width: 275.0)
//                .background(Color.ASMlighterGreen)
//                .cornerRadius(8.0)
//
//                Text("Voeg een nieuwe coach toe.")
//                    .padding(.bottom, 40.0)
//
//                NavigationLink(
//                    destination: QRcodeScanner(),
//                    label: {
//                        Text("Open QR code scanner")
//                            .fontWeight(.bold)
//                            .frame(maxWidth: 275, minHeight: 44)
//                            .foregroundColor(Color.ASMgreen)
//                    })
//                    .isDetailLink(false)
//                    .border(Color.ASMgreen, width: 3)
//                    .cornerRadius(8.0)
//
//
//            }
//            .padding(.top, 75.0)
        }
    }
//}
//}
struct CoachesPage_Previews: PreviewProvider {
    static var previews: some View {
        CoachesPage()
    }
}
