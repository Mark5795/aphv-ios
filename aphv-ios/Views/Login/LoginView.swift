//
//  LoginView.swift
//  aphv-ios
//
//  Created by Mark Kea on 25/11/2020.
//

// log in with email and password
// if credentails are correct check if user is coach or sporter
// navigatie user the homepage

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var userViewModel = UserViewModel(userModel: UserModel())
    
    let localStorage = LocalStorage()
    
    @State var showingErrorAlert: Bool = false
//    @State var showingSuccesAlert: Bool = false
    @State var isHomePresented: Bool = false
    
    @State var showMenu = false
    
//    @State var email: String = ""
//    @State var password: String = ""
  
    //!!! Temporary for developing !!!
//    @State var email: String = "markmark@gmail.com"
    @State var email: String = "markcoach@gmail.com"
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

                        if(userViewModel.sendLoginUserRequest()) {
                            self.showingErrorAlert.toggle()
                            self.userViewModel.getUser()
                        }

                    }, label: {
                        Text("Aanmelden")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
                    .alert(isPresented: $showingErrorAlert) {
                        Alert(title: Text(userViewModel.alertTitle), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("Verder"), action: {if(userViewModel.alertTitle == "Inloggen gelukt!") {self.localStorage.isLoggedIn = true; self.isHomePresented = true}}))
                    }
                    .fullScreenCover(isPresented: $isHomePresented) {
                        if(userViewModel.role == "") {
                            HomeSporter()
                        } else {
                            HomeCoach()
                        }
                    }
                    
                }.padding(.horizontal, 25.0)
                Spacer()
                    .frame(height: 20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
