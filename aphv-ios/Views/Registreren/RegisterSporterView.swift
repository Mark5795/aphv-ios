//
//  RegistreerSporterView.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct RegisterSporterView: View {
    
    @ObservedObject var dropDownModel = DropDownModel()
//    @ObservedObject var userViewModel = UserViewModel()
    private let userViewModel : UserViewModel
    
//    @State var role: String = "child"
//    @State var firstName: String = "mark"
//    @State var lastName: String = "kea"
//    @State var sport: String = "tennis"
//    @State var gender : String = ""
//    @State var dateOfBirth: String = "05-07-1995"
//    @State var email: String = "600331@student.inholland.nl"
//    @State var password: String = "test"
//    @State var passwordCheck: String = ""
    
    @State var trimVal : CGFloat = 0
    @State var checked = false
    @State var trimVal2 : CGFloat = 0
    @State var checked2 = false
    
    @State var isTryingToLogin: Bool = false
    @State var isRequestErrorViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    
            
                    VStack(alignment: .leading) {
                        Group {
                            Text("Kies je rol")
                            HStack {
                                RadioButtonGroups { selected in
                                    userViewModel.userModel.role = selected
                                }
                            }
                            .padding()
                            .background(Color.InputFieldLightGrey)
                            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            
                            
                            InputTextFieldView(stateBinding: userViewModel.userModel.firstName, title: "Voornaam", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: userViewModel.userModel.lastName, title: "Achternaam", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: userViewModel.userModel.sport, title: "Sport", placeholder: "", secureTextField: false)
                        }
                        
                        Group {
                            Text("Geslacht")
                            DropDownView(gender: userViewModel.userModel.gender)
                        }
                        
                        Group {
                            InputTextFieldView(stateBinding: userViewModel.userModel.dateOfBirth, title: "Geboortedatum", placeholder: "01-01-1980", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: userViewModel.userModel.email, title: "Emailadres", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: userViewModel.userModel.password, title: "Wachtwoord", placeholder: "", secureTextField: true)
                            
                            InputTextFieldView(stateBinding: userViewModel.passwordCheck, title: "Wachtwoord controle", placeholder: "", secureTextField: true)
                            
                            HStack{
                                Button(action: {
                                    if !self.checked {
                                        withAnimation(Animation.easeIn(duration: 0.8)) {
                                            self.trimVal = 1
                                            self.checked.toggle()
                                        }
                                    } else {
                                        withAnimation {
                                            self.trimVal = 0
                                            self.checked.toggle()
                                        }
                                    }
                                })
                                {
                                    CheckboxView(checked: $checked, trimVal: $trimVal)
                                }
                                Text("Ik ga akkoord met de voorwaarden.")
                            }
                            
                            HStack{
                                Button(action: {
                                    if !self.checked {
                                        withAnimation(Animation.easeIn(duration: 0.8)) {
                                            self.trimVal2 = 1
                                            self.checked2.toggle()
                                        }
                                    } else {
                                        withAnimation {
                                            self.trimVal2 = 0
                                            self.checked2.toggle()
                                        }
                                    }
                                })
                                {
                                    CheckboxView(checked: $checked2, trimVal: $trimVal2)
                                }
                                Text("Ik heb goedkeuring van een ouder, voogd of coach of ik ben 18 jaar of ouder.")
                            }
                            
                            Button(action: {
//                                RegisterService.shared.Register(role: role, email: email, firstName: firstName, lastName: lastName, password: password, dateOfBirth: dateOfBirth, gender: gender, sport: sport) { (result) in
                                userViewModel.RegisterUser()
                            }, label: {
                                Text("Aanmaken")
                                .frame(maxWidth: .infinity, minHeight: 44)
                                    .foregroundColor(.white)
                            })
                            .background(Color.blue)
                            .cornerRadius(8.0)

                        }
                        
                    }
                }.padding(.horizontal, 25.0)
            }
        }
    }
}

struct RegistreerSporterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSporterView()
    }
}
