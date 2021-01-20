//
//  TestLoginView.swift
//  aphv-ios
//
//  Created by Mark Kea on 19/01/2021.
//

// log in with email and password
// if credentails are correct check if user is coach or sporter
// navigatie user the homepage

import SwiftUI
import AlertX

struct TestLoginView: View {
    
    @ObservedObject var userViewModel = UserViewModel(userModel: UserModel())
    
    let localStorage = LocalStorage()
    
    @State var showAlertX: Bool = false
    
//    @State var showingErrorAlert: Bool = false
//    @State var showingSuccesAlert: Bool = false
    @State var isHomeSportPresented: Bool = false
    
//    @State var email: String = ""
//    @State var password: String = ""
  
    //!!! Temporary for developing !!!
    @State var email: String = "markmark@gmail.com"
    @State var password: String = "Welkom01!"
    
    var body: some View {
        NavigationView {
            VStack() {
                ZStack() {
                    TopCurve(title: "Aanmelden")
                }
                .navigationTitle(Text(""))
                .zIndex(0)
                
                Image("ASMLogo")
                
                Spacer()
                    .frame(height: 80)
                
                VStack(alignment: .leading) {
                    InputTextFieldView(stateBinding: $email, title: "Emailadres", placeholder: "", secureTextField: false)
                    
                    InputTextFieldView(stateBinding: $password, title: "Wachtwoord", placeholder: "", secureTextField: true)
                    
                    Spacer()
                        .frame(height: 20)

                    Button(action: {
                        userViewModel.email = self.email.lowercased()
                        userViewModel.password = self.password
                        userViewModel.sendLoginUserRequest()
//                            self.showingErrorAlert.toggle
                        self.showAlertX = true

                    }, label: {
                        Text("Aanmelden")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
//                    .alert(isPresented: $showingErrorAlert) {
//                        Alert(title: Text(userViewModel.alertTitle), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("Verder"), action: {if(userViewModel.alertTitle == "Inloggen gelukt!") {self.localStorage.isLoggedIn = true; self.isHomeSportPresented = true}}))
//                    }
                    .alertX(isPresented: $showAlertX, content: {
                        AlertX(title: Text(userViewModel.alertTitle)
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
                    .fullScreenCover(isPresented: $isHomeSportPresented) {
                        HomeSporter()
                    }
                    
                }.padding(.horizontal, 25.0)
                Spacer()
                    .frame(height: 20)
            }
        }
    }
}

struct TestLoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
