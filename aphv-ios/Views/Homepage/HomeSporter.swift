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
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                TopCurve(title: "Uitleg Groeiberekening")
                VStack {
                    
                    Spacer()
                    
                    Text("Om aan de slag te gaan met de")
                    Text("groeiberkenening, is het handig om eerst")
                    Text("jouw coach toe te voegen.")
                        .padding(.bottom, 10.0)
                    
                    
                    Text("Heb je geen coach?")
                        .padding(.bottom, 10.0)
                    
                    
                    Text("Begin dan direct met de groeiberekening!")
                    
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink(
                        destination: GroeiberekeningIntro(isFlowStarted: $isFlowStarted),
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
                        NavigationLink(destination: TestCoachesPage()){
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
        }
    }
}

struct HomeSporter_Previews: PreviewProvider {
    static var previews: some View {
        HomeSporter()
    }
}
