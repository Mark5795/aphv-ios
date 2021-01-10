////
////  GroeiberekeningStap3.swift
////  aphv-ios
////
////  Created by Mark Kea on 18/11/2020.
////
//
//import SwiftUI
//
//struct GroeiberekeningStap3: View {
//    
//    @State var gewicht: String = ""
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
//                        Image("Weegschaal")
////                            .position(x: 72.24, y: 300)
//                        
//                        VStack(alignment: .leading){
//                            Text("Schoenen uit en lichte sportkleding aan")
//                        }
//                        .frame(width: 210.0)
////                        .position(x: 40, y: 300)
//                    }
//                    
//                    VStack(alignment: .leading) {
//                        Text("Zithoogte in cm")
//                            .padding(.bottom, -7.0)
//                        TextField("", text: $gewicht)
//                            .keyboardType(.numberPad)
//                            .frame(width: 330.0, height: 50.0)
//                            .background(Color("InputFieldLightGrey"))
//                            .border(Color("BorderGrey"), width: 1)
//                            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
//                    }
//                    
////                  Temporary comment
////                    NavigationLink(destination: GroeiberekeningResultaat(groeiberekeningViewModel: groeiberekeningViewModel)) {
////                        Text("Bereken")
////                            .font(.system(size: 20))
////                            .fontWeight(.medium)
////                            .foregroundColor(Color.white)
////                            .multilineTextAlignment(.center)
////
////                    }
////                        .frame(width: 335.0, height: 45.0)
////                        .background(Color("ASMgreen"))
////                        .cornerRadius(5)
////                        .zIndex(0)
//                }
//            }
//        }
//    }
//}
//
////struct GroeiberekeningStap3_Previews: PreviewProvider {
////    static var previews: some View {
////        GroeiberekeningStap3()
////    }
////}
