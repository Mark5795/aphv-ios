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
    @State var isHomeSportPresented: Bool = false
    
    @State var showMenu = false
    
//    @State var email: String = ""
//    @State var password: String = ""
  
    //!!! Temporary for developing !!!
    @State var email: String = "markmark@gmail.com"
    @State var password: String = "Welkom01!"
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    TestTopCurve(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        TestTopCurve()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
        
        NavigationView {
            VStack() {
                ZStack() {
                    TestTopCurve(title: "Aanmelden", showHamburgerMenu: false)
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
                        Alert(title: Text(userViewModel.alertTitle), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("Verder"), action: {if(userViewModel.alertTitle == "Inloggen gelukt!") {self.localStorage.isLoggedIn = true; self.isHomeSportPresented = true}}))
                    }
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
