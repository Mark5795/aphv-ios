//
//  Groeiberekeningstap1WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Groeiberekeningstap1WithoutAccount: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel
    
    @State var gender : String = ""
    @State var dateOfBirth: String = ""
    
    var body: some View {
        VStack {
            Text("Zonder account onthoud de app jouw geboortedatum en geslacht niet. Vul de volgende velden in.")
            
            Group {
                Text("Geslacht")
                DropDownView(gender: $gender)
            }
            
            InputTextFieldView(stateBinding: $dateOfBirth, title: "Geboortedatum", placeholder: "01-01-1980", secureTextField: false)
            
            Button(action: {self.groeiberekeningWithoutAccountViewModel.pageIndex = 4}, label: {
                Text("Beginnen")
                    .fontWeight(.bold)
                    .frame(maxWidth: 250, minHeight: 44)
                    .foregroundColor(.white)
            })
            .background(Color.ASMgreen)
            .cornerRadius(8.0)
            
        }
    }
}

struct Groeiberekeningstap1WithoutAccount_Previews: PreviewProvider {
    static var previews: some View {
        Groeiberekeningstap1WithoutAccount(groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel())
    }
}
