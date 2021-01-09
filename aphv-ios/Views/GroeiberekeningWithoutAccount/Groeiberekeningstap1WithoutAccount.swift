//
//  Groeiberekeningstap1WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Groeiberekeningstap1WithoutAccount: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel
    @ObservedObject var groeiberekeningViewModel = GroeiberekeningViewModel(groeiberekeningModel: GroeiberekeningModel())
    
    @State var gender : String = ""
    @State var dateOfBirth: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Zonder account onthoud de app jouw geboortedatum en geslacht niet. Vul de volgende velden in.")
                .multilineTextAlignment(.center)
            
            Group {
                Text("Geslacht")
                DropDownView(gender: $gender)
            }
            
            InputTextFieldView(stateBinding: $dateOfBirth, title: "Geboortedatum", placeholder: "01-01-1980", secureTextField: false)
            

            Spacer()
            
            Button(action: {
                    groeiberekeningViewModel.gender = self.gender
                groeiberekeningViewModel.dateOfBirth = self.dateOfBirth
                self.groeiberekeningWithoutAccountViewModel.pageIndex = 2                
            }, label: {
                Text("Volgende")
                    .fontWeight(.bold)
                    .frame(maxWidth: 325, minHeight: 44)
                    .foregroundColor(.white)
            })
            .background(Color.ASMgreen)
            .cornerRadius(8.0)
            
        }.padding(.horizontal, 25.0)
    }
}

struct Groeiberekeningstap1WithoutAccount_Previews: PreviewProvider {
    static var previews: some View {
        Groeiberekeningstap1WithoutAccount(groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel())
    }
}
