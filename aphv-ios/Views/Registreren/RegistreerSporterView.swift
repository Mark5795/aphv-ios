//
//  RegistreerSporterView.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

struct RegistreerSporterView: View {
    
    @State var rol: String = "child"
    @State var voornaam: String = "mark"
    @State var achternaam: String = "kea"
    @State var sport: String = "tennis"
    @State var geslacht: String = "male"
    @State var geboortedatum: String = "05-07-1995"
    @State var email: String = "600331@student.inholland.nl"
    @State var wachtwoord: String = "test"
    @State var wachtwoordCheck: String = ""
    
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
                                    rol = selected
                                }
                            }
                            .padding()
                            .background(Color.InputFieldLightGrey)
                            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                            
                            
                            InputTextFieldView(stateBinding: $voornaam, title: "Voornaam", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $achternaam, title: "Achternaam", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $sport, title: "Sport", placeholder: "", secureTextField: false)
                        }
                        
                        Group {
                            Text("Geslacht")
//                            DropDown {selected in geslacht = selected}
                            DropDown()
                        }
                        
                        Group {
                            InputTextFieldView(stateBinding: $geboortedatum, title: "Geboortedatum", placeholder: "01-01-1980", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $email, title: "Emailadres", placeholder: "", secureTextField: false)
                            
                            InputTextFieldView(stateBinding: $wachtwoord, title: "Wachtwoord", placeholder: "", secureTextField: true)
                            
                            InputTextFieldView(stateBinding: $wachtwoordCheck, title: "Wachtwoord controle", placeholder: "", secureTextField: true)
                            
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
                                RegistreerService.shared.Registeer(role: rol, email: email, firstName: voornaam, lastName: achternaam, password: wachtwoord, dateOfBirth: geboortedatum, gender: geslacht, sport: sport) { (result) in
                                    switch result {
                                    case .success(_):
                                            print("gelukt")
//                                        self.presentationMode.wrappedValue.dismiss()
                                    case .failure(_):
                                            print("Niet gelukt")
//                                        self.isRequestErrorViewPresented = true
                                    }
//                                    self.isTryingToRegister = false
                                }
                            }, label: {
                                Text("Aanmaken")
                                .frame(maxWidth: .infinity, minHeight: 44)
                                    .foregroundColor(.white)
                            })
                            .background(Color.blue)
                            .cornerRadius(8.0)
                            
//                            Button(action: {
//                                RegistreerService.shared.getUsers() { (result) in
//                                    switch result {
//                                    case .success(_):
//                                            print("gelukt")
////                                        self.presentationMode.wrappedValue.dismiss()
//                                    case .failure(_):
//                                            print("Niet gelukt")
////                                        self.isRequestErrorViewPresented = true
//                                    }
////                                    self.isTryingToRegister = false
//                                }
//                            }, label: {
//                                Text("Aanmaken")
//                                .frame(maxWidth: .infinity, minHeight: 44)
//                                    .foregroundColor(.white)
//                            })
//                            .background(Color.blue)
//                            .cornerRadius(8.0)

                        }
                        
                    }
                }.padding(.horizontal, 25.0)
            }
        }
    }
}

struct RegistreerSporterView_Previews: PreviewProvider {
    static var previews: some View {
        RegistreerSporterView()
    }
}

struct DropDown: View {
    @State var geslacht: String = ""
    @State var placeholder: String = ""
    @State var expand = false
//    let callback: (String)->()
    
    var body: some View {
        VStack() {
            VStack() {
                HStack() {
                    Text(placeholder)
                    Spacer()
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(.black)
                }
                .frame(height: 25)
                .onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    Button(action: {
                        geslacht = "male"
                        placeholder = "Jongen"
                        self.expand.toggle()
                    }) {
                        Text("Jongen")
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                    Divider()
                    
                    Button(action: {
                        geslacht = "female"
                        placeholder = "Meisje"
                        self.expand.toggle()
                    }) {
                        Text("Meisje")
                            .padding()
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            .background(Color.InputFieldLightGrey)
            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
            .animation(.spring())
        }
    }
}
