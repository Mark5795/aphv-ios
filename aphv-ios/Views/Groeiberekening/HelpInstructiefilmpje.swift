//
//  HelpInstructiefilmpje.swift
//  aphv-ios
//
//  Created by Mark Kea on 19/11/2020.
//

import SwiftUI

struct HelpInstructiefilmpje: View {
    var body: some View {
        NavigationView {
            ZStack() {
                TopCurve(title: "Instructiefilmpje")
                
                VStack {
                    Text("Bekijk het filmpje met uitleg over de groeiberekening")
                        .multilineTextAlignment(.center)
                        .frame(width: 230.0)
                        .padding(.bottom, 50.0)
                    
                    NavigationLink(destination: VideoGroeiberekeningUitleg()) {
                        Image("VideoThumbnail")
                    }
                }
            }
            .navigationTitle(Text(""))
        }
    }
}

struct HelpInstructiefilmpje_Previews: PreviewProvider {
    static var previews: some View {
        HelpInstructiefilmpje()
    }
}
