//
//  GroeiberekeningIntro.swift
//  aphv-ios
//
//  Created by Mark Kea on 12/11/2020.
//

import SwiftUI

struct GroeiberekeningIntro: View {
    var body: some View {
        NavigationView {
            ZStack() {
                TopCurve(title: "Groeiberekening")
                
                VStack {
                    NavigationLink(destination: VideoGroeiberekeningUitleg()) {
                        Image("VideoThumbnail")
                    }
                    
                    Text("Je staat op het punt om je APHV te meten.\n\nGeen idee wat de APHV is?\nKijk dan het filmpje!\n\nZorg ervoor dat iemand je kan helpen\n met het opmeten en lees de instructies\n goed door.\n\nMeet minstens 2 keer voordat\nje de meting invult!")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20.0)
                        .frame(width: 340.0)
                        
                        NavigationLink(destination: GroeiberekeningStap1()) {
                            Text("Start Groeiberekening")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            
                        }
                        .frame(width: 335.0, height: 45.0)
                        .background(Color("ASMgreen"))
                        .cornerRadius(5)
                }
                .padding(.top, -70.0)
            }
            .navigationTitle(Text(""))
        }
    }
}

struct GroeiberekeningIntro_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GroeiberekeningIntro()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
