//
//  GroeiberekeningResultaat.swift
//  aphv-ios
//
//  Created by Mark Kea on 19/11/2020.
//

import SwiftUI

struct GroeiberekeningResultaat: View {
    @StateObject var grafiekManger = GrafiekManager()
    var body: some View {
        NavigationView {
            VStack() {
                HStack() {
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
                    Spacer()

                    Text("Resultaat")
                }
                
                GraphView()
            }
            .environmentObject(grafiekManger)
        }
    }
}

struct GroeiberekeningResultaat_Previews: PreviewProvider {
    static var previews: some View {
        GroeiberekeningResultaat()
    }
}
