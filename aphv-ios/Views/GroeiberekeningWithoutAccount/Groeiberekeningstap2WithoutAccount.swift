//
//  Groeiberekeningstap1WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Groeiberekeningstap2WithoutAccount: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel
    
    @State var lengte: String = ""
    
    var body: some View {
        NavigationView {
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
                    HStack {
                        Image("TotaleLengteMannetje")
//                            .position(x: 72.24, y: 300)
                        
                        VStack(alignment: .leading){
                            Text("Hoofd, schouders, billen en hakken tegen de muur aan")
                            
                            Text("Kijk recht vooruit")
                                .padding(.top, 15.0)
                            
                            Text("Ontspan je schouders")
                                .padding(.top, 15.0)
                            
                            Text("Hang je armen ontspannen langs je lichaam")
                                .padding(.top, 15.0)
                            
                            Text("Houd je benen recht met je knieen tegen elkaar aan")
                                .padding(.top, 15.0)
                            
                            Text("Schoenen uit en enkels bijna tegen elkaar aan")
                                .padding(.top, 15.0)
                        }
                        .frame(width: 210.0)
//                        .position(x: 40, y: 300)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Lengte in cm")
                            .padding(.bottom, -7.0)
                        TextField("", text: $lengte)
                            .keyboardType(.numberPad)
                            .frame(width: 330.0, height: 50.0)
                            .background(Color("InputFieldLightGrey"))
                            .border(Color("BorderGrey"), width: 1)
                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    }
                    
                    Button(action: { self.groeiberekeningWithoutAccountViewModel.pageIndex = 2
                        self.groeiberekeningWithoutAccountViewModel.lengte = lengte }, label: {
                        Text("Stap 2")
                            .fontWeight(.bold)
                            .frame(width: 335.0, height: 45.0)
                            .foregroundColor(.white)
                    })
                    .background(Color.ASMgreen)
                    .cornerRadius(8.0)
                    
//                    NavigationLink(destination: GroeiberekeningStap2()) {
//                        Text("Stap 1")
//                            .font(.system(size: 20))
//                            .fontWeight(.medium)
//                            .foregroundColor(Color.white)
//                            .multilineTextAlignment(.center)
//                            
//                    }
//                        .frame(width: 335.0, height: 45.0)
//                        .background(Color("ASMgreen"))
//                        .cornerRadius(5)
//                        .zIndex(0)
                }
            }
        }
    }
}

struct Groeiberekeningstap2WithoutAccount_Previews: PreviewProvider {
    static var previews: some View {
        Groeiberekeningstap2WithoutAccount(groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel())
    }
}
