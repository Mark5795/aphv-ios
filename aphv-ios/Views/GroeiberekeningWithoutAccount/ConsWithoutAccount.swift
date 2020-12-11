//
//  ConsWithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct ConsWithoutAccount: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel
    
    var body: some View {
        VStack {
            
            Group {
                Text("Nadelen geen account")
                    .fontWeight(.bold)
                    .padding(.top, 30.0)
                
                Text("Je moet bij elke berekening jouw geboortedatum en geslacht invullen.")
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 50.0)
                    .padding(.top)
                    
                Text("Met een account wordt dit voor je bewaard.")
                    .padding(.bottom)
                
                Text("Je kan geen groeiberekeningen resultaten bewaren.")
                    .padding(.bottom)
                
                Text("Je kan niet je resultaat uit de groeiberekening met bijvoorbeeld je coach of arts delen.")
                    .padding(.bottom)
                
                Text("Je kan niet je groeiberekeningen resultaten vergelijken met die van de gemiddelde jongens of meisjes.")
            }
            .padding(.horizontal, 20.0)
            
            Spacer()
            
            Button(action: {self.groeiberekeningWithoutAccountViewModel.pageIndex = 1}, label: {
                Text("Account Aanmaken")
                    .fontWeight(.bold)
                    .frame(maxWidth: 310, minHeight: 44)
                    .foregroundColor(.white)
            })
            .background(Color.ASMgreen)
            .cornerRadius(8.0)
            
            
            //For spacing
            Text("")
                .padding(.vertical, 1.0)
            
            Button(action: {self.groeiberekeningWithoutAccountViewModel.pageIndex = 2}, label: {
                Text("Verdergaan zonder account")
                    .fontWeight(.bold)
                    .frame(maxWidth: 310
                           , minHeight: 44)
                    .foregroundColor(.white)
            })
            .background(Color.ASMgreen)
            .cornerRadius(8.0)
        }
    }
}

struct ConsWithoutAccount_Previews: PreviewProvider {
    static var previews: some View {
        ConsWithoutAccount(groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel())
    }
}
