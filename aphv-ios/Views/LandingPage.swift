//
//  LandingPAge.swift
//  aphv-ios
//
//  Created by Mark Kea on 17/12/2020.
//

import SwiftUI

struct LandingPage: View {
    
    @State var isFlowStarted: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("ASMLogo")
                Spacer()
                
                Text("Een account aanmaken is nodig om \ngoed je groei in meting te brengen en de \nresultaten te kunnen delen met je coach.")
                    .multilineTextAlignment(.center)
                    .frame(width: 310.0, height: 175.0)
                
                NavigationLink(
                    "registeren",
                    destination: RegisterPagerView(),
                    isActive: $isFlowStarted
                )
                .isDetailLink(false)
                .navigationTitle("Flow Example")
                
            }
        }
    }
}
