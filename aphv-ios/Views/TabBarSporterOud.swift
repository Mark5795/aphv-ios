//
//  TabBarSporter.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//

import SwiftUI

struct TabBarSporterOud: View {
    
    @State var isFlowStarted: Bool = false
    
    var body: some View {
//        NavigationView{
            HStack {
                NavigationLink(destination: HomeSporter()){
                    VStack {
                        Image("IconHome")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/35.0/*@END_MENU_TOKEN@*/, height: 27.0)
                        Text("Home")
                            .font(.system(size: 19))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ASMgreen"))
                    }
                }
                .padding(.top, 10.0)
                .padding(.trailing, 15.0)

                NavigationLink(destination: GroeiberekeningIntro(isFlowStarted: $isFlowStarted)){
                    VStack {
                        Image("IconGroeiberekening")
                            .resizable()
                            .frame(width: 24.5, height: 28.0)
                        Text("Groeiberekenen")
                            .font(.system(size: 19))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ASMgreen"))
                        }
                    }
                .padding([.top, .leading, .trailing], 10.0)
                NavigationLink(destination: CoachesPage()){
                    VStack {
                        Image("IconSportersEnCoaches")
                            .resizable()
                            .frame(width: 29.0, height: 29.0)
                        Text("Coaches")
                            .font(.system(size: 19))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ASMgreen"))
                        }
                }
                .padding(.top, 10.0)
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 73)
            .border(Color("BorderGrey"), width: 2)
            
        }
    }
//}

struct TabBarSporterOud_Previews: PreviewProvider {
    static var previews: some View {
        TabBarSporterOud()
    }
}
