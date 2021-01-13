//
//  Groeiberekeningstap1WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Groeiberekeningstap1: View {
    
    @ObservedObject var groeiberekeningViewModel : GroeiberekeningViewModel
    
    @Binding var isFlowStarted: Bool
    
    @State var standingHeightText : String = ""
    @State var standingHeight: Double = 0
    
    var body: some View {
            ZStack {
                TopCurve(title: "Groeiberekening")
                VStack {
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color.ASMgreen)
                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("1")
                                .foregroundColor(.white)
                        }
                        
                        Rectangle()
                            .frame(width: 53.0, height: 3.0)
                            .foregroundColor(.ASMgreen)
                        
                        ZStack{
                            Circle()
                                .stroke(Color.ASMgreen, lineWidth: 3)
                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("2")
                                .foregroundColor(.ASMgreen)
                        }
                        
                        Rectangle()
                            .frame(width: 53.0, height: 3.0)
                            .foregroundColor(.ASMgreen)
                        
                        ZStack{
                            Circle()
                                .stroke(Color.ASMgreen, lineWidth: 3)
                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("3")
                                .foregroundColor(.ASMgreen)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image("TotaleLengteMannetje")
                        
                        VStack(alignment: .leading){
                            Text("Hoofd, schouders, billen en hakken tegen de muur aan")
                                .frame(height: 75)
                            
                            Text("Kijk recht vooruit")
                                .frame(height: 25)
                            
                            Text("Ontspan je schouders")
                                .frame(height: 50)
                            
                            Text("Hang je armen ontspannen langs je lichaam")
                                .frame(height: 50)
                            
                            Text("Houd je benen recht met je knieen tegen elkaar aan")
                                .frame(height: 75)
                            
                            Text("Schoenen uit en enkels bijna tegen elkaar aan")
                                .frame(height: 50)
                        }
                        .frame(width: 210.0)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Lengte in cm")
                            .padding(.bottom, -7.0)
                        TextField("", text: $standingHeightText)
                            .keyboardType(.numberPad)
                            .frame(width: 330.0, height: 50.0)
                            .background(Color("InputFieldLightGrey"))
                            .border(Color("BorderGrey"), width: 1)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    }
                    
                    NavigationLink(destination: Groeiberekeningstap2(groeiberekeningViewModel: groeiberekeningViewModel, isFlowStarted: $isFlowStarted), label : {
                        Text("Stap 2")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    })
                    .simultaneousGesture(TapGesture().onEnded{
                        standingHeight = (standingHeightText as NSString).doubleValue
                        groeiberekeningViewModel.standingHeight = standingHeight
                    })
                    .frame(width: 335.0, height: 45.0)
                    .background(Color("ASMgreen"))
                    .cornerRadius(5)
                    .zIndex(0)
                }
            }
        }
    }

//struct Groeiberekeningstap1_Previews: PreviewProvider {
//    static var previews: some View {
//        Groeiberekeningstap2WithoutAccount()
//    }
//}
