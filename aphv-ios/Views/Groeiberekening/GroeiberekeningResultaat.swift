//
//  GroeiberekeningResultaat.swift
//  aphv-ios
//
//  Created by Mark Kea on 19/11/2020.
//

import SwiftUI

struct GroeiberekeningResultaat: View {
    //    @StateObject var grafiekManger = GrafiekManager()
    @ObservedObject var groeiberekeningViewModel : GroeiberekeningViewModel
    @State var isCreateAccountPresented: Bool = false
    @State var isFlowStarted: Bool = false
    
    var body: some View {
        ZStack {
            TopCurve(title: "Groeiberekening")
            VStack(alignment: .leading) {
                HStack() {
                    Spacer()
                    Text("Resultaat")
                        .padding(.trailing, -50.0)
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    NavigationLink(destination: HelpInstructiefilmpje()) {
                        ZStack{
                            Circle()
                                .fill(Color.ASMroze)
                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: .center)
                            
                            Text("?")
                                .foregroundColor(.white)
                                .font(.system(size: 36))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.trailing)
                }
                Text("PHV: ,\(groeiberekeningViewModel.phv)")
                Text("Huidige fase: ,\(groeiberekeningViewModel.growthPhase)")
                //                GraphView()
                
                Button(action: { self.isCreateAccountPresented = true}, label: {
                    Text("Verdergaan zonder account")
                        .fontWeight(.bold)
                        .frame(maxWidth: 325, minHeight: 44)
                        .foregroundColor(.white)
                })
                .fullScreenCover(isPresented: $isCreateAccountPresented) {
                    RegisterChooseRole(isFlowStarted: $isFlowStarted)
                }
                .background(Color.ASMgreen)
                .cornerRadius(8.0)
                
            }
            //        .environmentObject(grafiekManger)
        }
    }
}

//struct GroeiberekeningResultaat_Previews: PreviewProvider {
//    static var previews: some View {
//        GroeiberekeningResultaat()
//    }
//}
