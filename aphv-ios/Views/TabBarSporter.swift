//
//  TabBarSporter.swift
//  aphv-ios
//
//  Created by Mark Kea on 16/11/2020.
//

import SwiftUI

struct TabBarSporter: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeSporter()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image("IconHome")
                    Text("Home")
                        .font(.system(size: 19))
                }
                .tag(0)
            
            GroeiberekeningIntro()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image("IconGroeiberekening")
                    Text("Groeiberekenen")
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ASMgreen"))
                }
                .tag(1)
            
            CoachesPagina()
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image("IconSportersEnCoaches")
                    Text("Coaches")
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ASMgreen"))
                }
                .tag(2)
        }
        .onAppear(){
            UITabBar.appearance().barTintColor = .white
        }
    }
}

struct TabBarSporter_Previews: PreviewProvider {
    static var previews: some View {
        TabBarSporter()
    }
}
