//
//  GroeiberekeningIntroWithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct GroeiberekeningIntroWithoutAccount: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel
    
    var body: some View {
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
                    .padding(.vertical, 15.0)
                    .frame(width: 340.0, height: 250)
                
                Button(action: {self.groeiberekeningWithoutAccountViewModel.pageIndex = 1}, label: {
                    Text("Start Groeiberekening")
                        .fontWeight(.bold)
                        .frame(width: 335.0, height: 45.0)
                        .foregroundColor(.white)
                })
                .background(Color.ASMgreen)
                .cornerRadius(8.0)
                
                TabBarSporterOud()
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
        }
        .navigationTitle(Text(""))
    }
}

struct GroeiberekeningIntroWithoutAccount_Previews: PreviewProvider {
    static var previews: some View {
        GroeiberekeningIntroWithoutAccount(groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel())
            .previewDevice("iPhone 11 Pro")
    }
}