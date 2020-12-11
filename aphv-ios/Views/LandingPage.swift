//
//  LandingPage.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct LandingPage: View {
    
    @ObservedObject var mainViewModel : MainViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("ASMLogo")
            
            //For spacing
//            Text("")
//                .padding(.vertical, 30.0)
            
            Text("Een account aanmaken is nodig om \ngoed je groei in meting te brengen en de \nresultaten te kunnen delen met je coach.")
                .multilineTextAlignment(.center)
                .frame(width: 310.0, height: 175.0)
                
            
            Button(action: {self.mainViewModel.pageIndex = 1}, label: {
                Text("Aanmaken")
                    .fontWeight(.bold)
                    .frame(maxWidth: 310, minHeight: 44)
                    .foregroundColor(.white)
            })
            .background(Color.ASMgreen)
            .cornerRadius(8.0)
            
            
            //For spacing
            Text("")
                .padding(.vertical, 1.0)
            
            Button(action: {self.mainViewModel.pageIndex = 2}, label: {
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

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage(mainViewModel : MainViewModel())
    }
}
