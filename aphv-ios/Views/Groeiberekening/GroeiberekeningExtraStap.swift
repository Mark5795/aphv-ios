//
//  Groeiberekeningstap1WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct GroeiberekeningExtraStap: View {
    
    @ObservedObject var groeiberekeningViewModel : GroeiberekeningViewModel
    
    @Binding var isFlowStarted: Bool
    
    @State var gender : String = ""
    @State var dateOfBirth: String = ""
    
    var body: some View {
        ZStack {
            TopCurve(title: "Groeiberekening")
            VStack(alignment: .leading) {
                Text("Zonder account onthoud de app jouw geboortedatum en geslacht niet. Vul de volgende velden in.")
                    .multilineTextAlignment(.center)
                
                Group {
                    Text("Geslacht")
                    DropDownView(gender: $gender)
                }
                
                InputTextFieldView(stateBinding: $dateOfBirth, title: "Geboortedatum", placeholder: "01-01-1980", secureTextField: false)
                
                
                Spacer()
                
                NavigationLink(destination: Groeiberekeningstap1( groeiberekeningViewModel: groeiberekeningViewModel, isFlowStarted: $isFlowStarted)) {
                    Text("Volgende")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                }
                .simultaneousGesture(TapGesture().onEnded{
                    groeiberekeningViewModel.gender = self.gender
                    groeiberekeningViewModel.dateOfBirth = self.dateOfBirth
                })
                .frame(width: 335.0, height: 45.0)
                .background(Color("ASMgreen"))
                .cornerRadius(5)
                .zIndex(0)
                
            }.padding(.horizontal, 25.0)
        }
    }
}

//struct GroeiberekeningExtraStap_Previews: PreviewProvider {
//    static var previews: some View {
//        Groeiberekeningstap1WithoutAccount(groeiberekeningViewModel: GroeiberekeningViewModel(groeiberekeningModel: GroeiberekeningModel()), isFlowStarted: .constant(true))
//    }
//}
