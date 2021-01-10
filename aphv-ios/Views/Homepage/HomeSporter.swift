//
//  HomeSporter.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//


// Check if sporter got coaches

// if sporter does not have coaches, show text and start groeiberekening button

// else show date next meting, pager with calculations and pager with results. and start groeiberekenig button

// navbar on bottom

import SwiftUI

struct HomeSporter: View {
    //    let localStorage = LocalStorage()
    
    @ObservedObject var groeiberekeningViewModel = GroeiberekeningViewModel(groeiberekeningModel: GroeiberekeningModel())
    
    //    @Binding var isFlowStarted: Bool
    @State var isFlowStarted: Bool = false
    
    var body: some View {
        ZStack {
            TopCurve(title: "Uitleg Groeiberekening")
            NavigationView {
                NavigationLink(
                    destination: GroeiberekeningIntroWithoutAccount(isFlowStarted: $isFlowStarted),
                    isActive: $isFlowStarted,
                    label: {
                        Text("Start groeiberekening")
                            .fontWeight(.bold)
                            .frame(maxWidth: 310
                                   , minHeight: 44)
                            .foregroundColor(.white)
                    })
                    .isDetailLink(false)
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
            }
        }
    }
}

struct HomeSporter_Previews: PreviewProvider {
    static var previews: some View {
        HomeSporter()
    }
}
