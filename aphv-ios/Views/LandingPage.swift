//
//  LandingPAge.swift
//  aphv-ios
//
//  Created by Mark Kea on 17/12/2020.
//

import SwiftUI

struct LandingPage: View {
    
    @State var isLoginPresented: Bool = false
    
    @State var isWithoutAccountPresented: Bool = false
    @State var isFlowStarted: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TopCurve(title: "")
                VStack {                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: LoginView(),
                            label: {
                                Text("Inloggen")
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                            })
                            .padding(.trailing)
                    }
                    
                    Image("ASMLogo")
                    
                    Spacer()
                    
                    Text("Een account aanmaken is nodig om \ngoed je groei in meting te brengen en de \nresultaten te kunnen delen met je coach.")
                        .multilineTextAlignment(.center)
                        .frame(width: 310.0, height: 175.0)
                    
                    NavigationLink(
                        destination: RegisterChooseRole(isFlowStarted: $isFlowStarted),
                        isActive: $isFlowStarted,
                        label: {
                            Text("Aanmaken")
                                .fontWeight(.bold)
                                .frame(maxWidth: 325, minHeight: 44)
                                .foregroundColor(.white)
                        })
                        .isDetailLink(false)
                        .background(Color.ASMgreen)
                        .cornerRadius(8.0)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Button(action: { self.isWithoutAccountPresented = true}, label: {
                        Text("Verdergaan zonder account")
                            .fontWeight(.bold)
                            .frame(maxWidth: 325, minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .sheet(isPresented: $isWithoutAccountPresented) {
                        ConsWithoutAccount()
                    }
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
                    
                    Spacer()
                        .frame(height: 30)
                }
            }
        }
    }
}
