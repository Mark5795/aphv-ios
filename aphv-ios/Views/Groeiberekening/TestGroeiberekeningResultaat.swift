//
//  TestGroeiberekenigResultaat.swift
//  aphv-ios
//
//  Created by Mark Kea on 19/01/2021.
//

import SwiftUI

struct TestGroeiberekeningResultaat: View {
    //    @StateObject var grafiekManger = GrafiekManager()
    @ObservedObject var groeiberekeningViewModel : GroeiberekeningViewModel
    @State var isCreateAccountPresented: Bool = false
    @State var isHomeSporterPresented: Bool = false
    //    @State var isFlowStarted: Bool = false
    
    let localStorage = LocalStorage()
    
    var body: some View {
        NavigationView{
            ZStack {
                TopCurve(title: "Groeiberekening")
                
                VStack(alignment: .leading) {
                    HStack() {
                        if(localStorage.isLoggedIn) {
                            Button(action: {self.isHomeSporterPresented = true }, label: {
                                Text("Terug")
                                
                            })
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .fullScreenCover(isPresented: $isHomeSporterPresented) {
                                HomeSporter()
                            }
                        }
                        
                        Spacer()
                        
                        Text("Resultaat")
                            .padding(.trailing, -30.0)
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
                    }
                    
                    Text("PHV: \(groeiberekeningViewModel.phv, specifier: "%.2f")")
                    Text("Huidige fase: \(groeiberekeningViewModel.growthPhase)")
                    //                GraphView()
                    Spacer()
                    
                    if(!localStorage.isLoggedIn) {
                        Button(action: { self.isCreateAccountPresented = true}, label: {
                            Text("Maak account aan en sla berekening op")
                                .fontWeight(.bold)
                                .frame(maxWidth: 325, minHeight: 44)
                                .foregroundColor(.white)
                        })
                        .fullScreenCover(isPresented: $isCreateAccountPresented) {
                            LandingPage()
                        }
                        .background(Color.ASMgreen)
                        .cornerRadius(8.0)
                    }
                }
                .padding(.horizontal, 25.0)
                .padding(.top, -40.0)
            }
            //        .environmentObject(grafiekManger)
        }
        
    }
}

struct TestGroeiberekeningResultaat_Previews: PreviewProvider {
    static var previews: some View {
        TestGroeiberekeningResultaat(groeiberekeningViewModel: GroeiberekeningViewModel(groeiberekeningModel: GroeiberekeningModel()))
    }
}
