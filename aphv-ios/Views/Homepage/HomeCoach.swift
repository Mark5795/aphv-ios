//
//  HomeCoach.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//



import SwiftUI

struct HomeCoach: View {
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
        }
    }
    
    struct MainView: View {
        @ObservedObject var groeiberekeningViewModel = GroeiberekeningViewModel(groeiberekeningModel: GroeiberekeningModel())
        
        @State var isFlowStarted: Bool = false
        @State private var selectedTab = 0
        
        @Binding var showMenu: Bool
        
        var body: some View {
            ZStack {
                TopCurve(title: "Uitleg Groeiberekening")
                
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
                .position(x: 40, y: -95)
                
                VStack {
                    
                    Spacer()
                    
                    
                    //tabbar
                    HStack {
                        //command out because we are already on the homepage
                        //                        NavigationLink(destination: HomeSporter()){
                        VStack {
                            Image("IconHome")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/35.0/*@END_MENU_TOKEN@*/, height: 27.0)
                            Text("Home")
                                .font(.system(size: 19))
                                .fontWeight(.bold)
                                .foregroundColor(Color("ASMgreen"))
                        }
                        .padding(.top, 10.0)
                        .padding(.trailing, 15.0)
                        //                        }
                        //                        .padding(.top, 10.0)
                        //                        .padding(.trailing, 15.0)
                        
                        
                        NavigationLink(destination: SportersPage()){
                            VStack {
                                Image("IconSportersEnCoaches")
                                    .resizable()
                                    .frame(width: 29.0, height: 29.0)
                                Text("Sporters")
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
        }
    }
}

struct HomeCoach_Previews: PreviewProvider {
    static var previews: some View {
        HomeCoach()
    }
}
