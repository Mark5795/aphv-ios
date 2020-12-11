//
//  RegisterChooseRole.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct RegisterChooseRole: View {
    
    @ObservedObject var registerViewModel : RegisterViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Kies je rol")
                    .padding(.leading, 30.0)
                Spacer()
            }
            
            HStack {
                Button(action: {self.registerViewModel.pageIndex = 1}, label: {
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
                .frame(width: 140.0)
                
                Button(action: {self.registerViewModel.pageIndex = 2}, label: {
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
                .frame(width: 140.0)
            }
            .padding()
            .background(Color.InputFieldLightGrey)
            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RegisterChooseRole_Previews: PreviewProvider {
    static var previews: some View {
        RegisterChooseRole(registerViewModel : RegisterViewModel())
    }
}
