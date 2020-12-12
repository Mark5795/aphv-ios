//
//  SuccesPopup.swift
//  aphv-ios
//
//  Created by Mark Kea on 12/12/2020.
//

import SwiftUI

struct SuccesPopup: View {
    
    @ObservedObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            Text("Je account is aangemaakt!")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .padding(.bottom)
            Text("Druk op de bevestiginslink in \nje email om je account te activeren.")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Button(action: {self.registerViewModel.pageIndex = 1}, label: {
                Text("Verder")
                    .font(.system(size: 21))
                    .fontWeight(.bold)
                    .foregroundColor(Color.ASMdarkGreen)
                
            })
            .frame(width: 140,height: 60)
            .background(Color.white)
            .cornerRadius(20)
        }
        .frame(width: 375,height: 200.0)
        .background(Color.ASMgreen)
    }
}

struct SuccesPopup_Previews: PreviewProvider {
    static var previews: some View {
        SuccesPopup()
    }
}
