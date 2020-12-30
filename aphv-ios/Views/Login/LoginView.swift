//
//  LoginView.swift
//  aphv-ios
//
//  Created by Mark Kea on 25/11/2020.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var userViewModel = UserViewModel(userModel: UserModel())
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                ZStack() {
                    TopCurve(title: "Aanmelden")
                }
                .navigationTitle(Text(""))
                .zIndex(0)
                
                VStack(alignment: .leading) {
                    InputTextFieldView(stateBinding: $email, title: "Emailadres", placeholder: "", secureTextField: false)
                    
                    InputTextFieldView(stateBinding: $password, title: "Wachtwoord", placeholder: "", secureTextField: true)
                    
                    Button(action: {
                        userViewModel.email = self.email
                        userViewModel.password = self.password
                        
                        userViewModel.sendLoginUserRequest()
//                        self.showingErrorAlert.toggle()
                    }, label: {
                        Text("Aanmaken")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
                    
                }.padding(.horizontal, 25.0)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
