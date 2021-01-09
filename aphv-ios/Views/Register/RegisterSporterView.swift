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
    
    @Binding var isFlowStarted: Bool
    
    @State var isWithoutAccountPresented: Bool = false
    
    @State var role: String = "Sporter"
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
    @State var isHomeSportPresented: Bool = false
    
    
    var body: some View {
        ZStack {
            TopCurve(title: "Account aanmaken")
            zIndex(1.0)
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text("Kies je rol")
                        HStack {
                            NavigationLink(
                                destination: RegisterSporterView(isFlowStarted: $isFlowStarted),
                                label: {
                                    HStack {
                                        Circle()
                                            .fill(Color.ASMgreen)
                                            .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Text("Sporter")
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.black)
                                        
                                    }
                                    .padding(.leading)
                                    Spacer()
                                })
                                .isDetailLink(false)
                                .frame(width: 140.0)
                            
                            NavigationLink(
                                destination: RegisterCoachView(isFlowStarted: $isFlowStarted),
                                label: {
                                    HStack {
                                        Circle()
                                            .stroke(Color.BorderGrey)
                                            .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Text("Coach")
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.black)
                                        
                                    }
                                    .padding(.leading)
                                    Spacer()
                                })
                                .isDetailLink(false)
                                .frame(width: 140.0)
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
                                .frame(width: 250.0, height: 100.0)
                        }
                        Button(action: {
                            userViewModel.role = self.role
                            userViewModel.firstName = self.firstName
                            userViewModel.lastName = self.lastName
                            userViewModel.sport = self.sport
                            userViewModel.gender = self.gender
                            userViewModel.dateOfBirth = self.dateOfBirth
                            userViewModel.email = self.email
                            userViewModel.password = self.password
                            userViewModel.passwordCheck = self.passwordCheck
                            userViewModel.checkedConditions = self.checkedConditions
                            userViewModel.checkedApproval = self.checkedApproval
                            
                            userViewModel.sendRegisterUserRequest()
                            
                            self.showingErrorAlert.toggle()
                        }, label: {
                            Text("Aanmaken")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .foregroundColor(.white)
                        })
                        .background(Color.ASMgreen)
                        .cornerRadius(8.0)
                        .alert(isPresented: $showingErrorAlert) {
                            Alert(title: Text(userViewModel.alertTitle), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("Verder"), action: {self.isHomeSportPresented = true}))
                        }
                        .fullScreenCover(isPresented: $isHomeSportPresented) {
                            HomeSporter()
                        }
                    }
                }
            }.padding(.horizontal, 25.0)
            .zIndex(0)
        }.zIndex(1)
    }
}


//struct RegistreerSporterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterSporterView()
//    }
//}
