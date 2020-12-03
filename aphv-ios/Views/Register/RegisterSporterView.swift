//
//  RegistreerSporterView.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct RegisterSporterView: View {
    
    @ObservedObject var dropDownModel = DropDownModel()
    @ObservedObject var userViewModel = UserViewModel(userModel: UserModel())
    
    @State var role: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var sport: String = ""
    @State var gender : String = ""
    @State var dateOfBirth: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    
    @State var trimVal : CGFloat = 0
    @State var checkedConditions = false
    @State var trimVal2 : CGFloat = 0
    @State var checkedApproval = false
    
    @State var isTryingToLogin: Bool = false
    @State var showingErrorAlert: Bool = false
    @State var showingSuccesAlert: Bool = false
    @State var showHomeSporter: Bool = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    
                    
                    VStack(alignment: .leading) {
                        Group {
                            Text("Kies je rol")
                            HStack {
                                RadioButtonGroups { selected in
                                    role = selected
                                }
                            }
                            .padding()
                            .background(Color.InputFieldLightGrey)
                            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            
                            InputTextFieldView(stateBinding: $firstName, title: "Voornaam", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $lastName, title: "Achternaam", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $sport, title: "Sport", placeholder: "", secureTextField: false)
                        }
                        
                        Group {
                            Text("Geslacht")
                            DropDownView(gender: $gender)
                        }
                        
                        Group {
                            InputTextFieldView(stateBinding: $dateOfBirth, title: "Geboortedatum", placeholder: "01-01-1980", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $email, title: "Emailadres", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $password, title: "Wachtwoord", placeholder: "", secureTextField: true)
                            
                            InputTextFieldView(stateBinding: $passwordCheck, title: "Wachtwoord controle", placeholder: "", secureTextField: true)
                            
                            HStack{
                                Button(action: {
                                    if !self.checkedConditions {
                                        withAnimation(Animation.easeIn(duration: 0.8)) {
                                            self.trimVal = 1
                                            self.checkedConditions.toggle()
                                        }
                                    } else {
                                        withAnimation {
                                            self.trimVal = 0
                                            self.checkedConditions.toggle()
                                        }
                                    }
                                })
                                {
                                    CheckboxView(checked: $checkedConditions, trimVal: $trimVal)
                                }
                                Text("Ik ga akkoord met de voorwaarden.")
                            }
                            
                            HStack{
                                Button(action: {
                                    if !self.checkedApproval {
                                        withAnimation(Animation.easeIn(duration: 0.8)) {
                                            self.trimVal2 = 1
                                            self.checkedApproval.toggle()
                                        }
                                    } else {
                                        withAnimation {
                                            self.trimVal2 = 0
                                            self.checkedApproval.toggle()
                                        }
                                    }
                                })
                                {
                                    CheckboxView(checked: $checkedApproval, trimVal: $trimVal2)
                                }
                                Text("Ik heb goedkeuring van een ouder, voogd of coach of ik ben 18 jaar of ouder.")
                            }
                            NavigationLink(destination: HomeSporter(), isActive: self.$showHomeSporter) {
                                Button(action: {
                                    userViewModel.updateUserModel(role: role, firstName: firstName, lastName: lastName, sport: sport, gender: gender, dateOfBirth: dateOfBirth, email: email, password: password, passwordCheck: passwordCheck, checkedConditions: checkedConditions, checkedApproval: checkedApproval)
                                        userViewModel.sendRegisterUserRequest()
                                    
                                        self.showingErrorAlert.toggle()
                                }, label: {
                                    Text("Aanmaken")
                                        .frame(maxWidth: .infinity, minHeight: 44)
                                        .foregroundColor(.white)
                                })
                                .background(Color.ASMgreen)
                                .cornerRadius(8.0)
                            }
                        }
                    }
                }.padding(.horizontal, 25.0)
            }
        }
        .alert(isPresented: $showingErrorAlert) {
            Alert(title: Text(userViewModel.alertTitle), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("Oke"), action: {self.showHomeSporter = true}))
        }
    }
}

struct RegistreerSporterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSporterView()
    }
}
