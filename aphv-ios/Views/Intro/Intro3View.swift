//
//  Intro3View.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Intro3View: View {
    @State var isLandingPresented: Bool = false
    let localStorage = LocalStorage()
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image("SportendMeisje2")
                .padding(.top, 40.0)
            
            Text("Verminder blessures")
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding(.top, 50.0)
            
            Text("Begrijp je lichaam en verminder \nde kans op blessures.")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.top, 20.0)
            
            Spacer()
            
            Button(action: {self.localStorage.hasSeenIntro = true; self.isLandingPresented = true}, label: {
                Text("Beginnen")
                    .fontWeight(.bold)
                    .frame(maxWidth: 250, minHeight: 44)
                    .foregroundColor(.white)
            })
            .fullScreenCover(isPresented: $isLandingPresented) {
                LandingPage()
            }
            .background(Color.ASMgreen)
            .cornerRadius(8.0)
            
            Spacer()
        }
    }
}


struct Intro3View_Previews: PreviewProvider {
    static var previews: some View {
        Intro3View()
    }
}
