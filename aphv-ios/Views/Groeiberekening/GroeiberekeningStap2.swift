////
////  GroeiberekeningStap2.swift
////  aphv-ios
////
////  Created by Mark Kea on 18/11/2020.
////
//
//import SwiftUI
//
//struct GroeiberekeningStap2: View {
//    
//    @State var zithoogte: String = ""
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                TopCurve(title: "Groeiberekening")
//                VStack {
//                    HStack {
//                        ZStack{
//                            Circle()
//                                .stroke(Color.ASMgreen, lineWidth: 3)
//                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            
//                            Text("1")
//                                .foregroundColor(.ASMgreen)
//                        }
//                        
//                        Rectangle()
//                            .frame(width: 53.0, height: 3.0)
//                            .foregroundColor(.ASMgreen)
//                        
//                        ZStack{
//                            Circle()
//                                .fill(Color.ASMgreen)
//                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            
//                            Text("2")
//                                .foregroundColor(.white)
//                        }
//                        
//                        Rectangle()
//                            .frame(width: 53.0, height: 3.0)
//                            .foregroundColor(.ASMgreen)
//                        
//                        ZStack{
//                            Circle()
//                                .stroke(Color.ASMgreen, lineWidth: 3)
//                                .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            
//                            Text("3")
//                                .foregroundColor(.ASMgreen)
//                        }
//                    }
//                    HStack {
//                        Image("ZithoogteMannetje")
////                            .position(x: 72.24, y: 300)
//                        
//                        VStack(alignment: .leading){
//                            Text("Kijk recht vooruit")
//                            
//                            Text("Ontspan je schouders")
//                                .padding(.top, 15.0)
//                            
//                            Text("Ga met je rug recht tegen de muur aan zitten")
//                                .padding(.top, 15.0)
//                        }
//                        .frame(width: 210.0)
////                        .position(x: 40, y: 300)
//                    }
//                    
//                    VStack(alignment: .leading) {
//                        Text("Zithoogte in cm")
//                            .padding(.bottom, -7.0)
//                        TextField("", text: $zithoogte)
//                            .keyboardType(.numberPad)
//                            .frame(width: 330.0, height: 50.0)
//                            .background(Color("InputFieldLightGrey"))
//                            .border(Color("BorderGrey"), width: 1)
//                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
//                    }
//                    
//                    NavigationLink(destination: GroeiberekeningStap3()) {
//                        Text("Stap 2")
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
//                }
//            }
//        }
//    }
//}
//
//struct GroeiberekeningStap2_Previews: PreviewProvider {
//    static var previews: some View {
//        GroeiberekeningStap2()
//    }
//}
