//
//  GroeiberekeningIntroWithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct GroeiberekeningIntroWithoutAccount: View {
    
    @ObservedObject var groeiberekeningViewModel = GroeiberekeningViewModel(groeiberekeningModel: GroeiberekeningModel())
    
    @Binding var isFlowStarted: Bool
    
    let localStorage = LocalStorage()
    
    var body: some View {
        ZStack {
            TopCurve(title: "Uitleg Groeiberekening")            
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
                
                if(localStorage.isLoggedIn) {
                    NavigationLink(destination: Groeiberekeningstap1WithoutAccount(groeiberekeningViewModel: groeiberekeningViewModel, isFlowStarted: $isFlowStarted)) {
                        Text("Start Groeiberekening")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(width: 335.0, height: 45.0)
                    .background(Color("ASMgreen"))
                    .cornerRadius(5)
                    .zIndex(0)
                } else {
                    NavigationLink(destination: GroeiberekeningExtraStapWithoutAccount(groeiberekeningViewModel: groeiberekeningViewModel, isFlowStarted: $isFlowStarted)) {
                        Text("Start Groeiberekening")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(width: 335.0, height: 45.0)
                    .background(Color("ASMgreen"))
                    .cornerRadius(5)
                    .zIndex(0)
                }
                

            }
            .navigationTitle(Text(""))
        }
    }
}

//struct GroeiberekeningIntroWithoutAccount_Previews: PreviewProvider {
//    static var previews: some View {
//        GroeiberekeningIntroWithoutAccount()
//    }
//}
