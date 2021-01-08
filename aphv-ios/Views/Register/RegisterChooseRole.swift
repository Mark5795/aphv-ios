//
//  RegisterChooseRole.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct RegisterChooseRole: View {
    
    @Binding var isFlowStarted: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Kies je rol")
                    .padding(.leading, 30.0)
                Spacer()
            }
            
            HStack {
                NavigationLink(
                    destination: RegisterSporterView(isFlowStarted: $isFlowStarted),
                    label: {
                        HStack {
                            Circle()
                                .stroke(Color.BorderGrey)
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
            
            Spacer()
        }
        
    }
}

//struct RegisterChooseRole_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterChooseRole()
//    }
//}
