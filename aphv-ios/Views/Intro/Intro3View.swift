//
//  Intro3View.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Intro3View: View {
    @State var isFlowStarted: Bool = false
    @ObservedObject var introViewModel : IntroViewModel
    @State var isMainPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                
                Image("SportendMeisje2")
                    .padding(.top, 100.0)
                
                Text("Verminder blessures")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .padding(.top, 50.0)
                
                Text("Begrijp je lichaam en verminder \nde kans op blessures.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20.0)
                
                Spacer()
                
                HStack {
//                    Button("Overslaan") {
//                        self.isMainPresented = true
//                    }
//                    .background(Color.ASMgreen)
//                    .cornerRadius(8.0)
//                    .fontWeight(.bold)
//                    .frame(maxWidth: 250, minHeight: 44)
//                    .foregroundColor(.white)
//                    .fullScreenCover(isPresented: $isMainPresented) {
//                        LandingPage()
//                    }
                    
                    Button(action: {self.isMainPresented.toggle()}, label: {
                        Text("Beginnen")
                            .fontWeight(.bold)
                            .frame(maxWidth: 250, minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
                }
                .padding(.bottom, 30.0)
            }
        }
    }
}


struct Intro3View_Previews: PreviewProvider {
    static var previews: some View {
        Intro3View(introViewModel: IntroViewModel())
    }
}
