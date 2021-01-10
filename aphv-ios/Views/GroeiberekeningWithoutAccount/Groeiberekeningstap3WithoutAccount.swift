//
//  Groeiberekeningstap4WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Groeiberekeningstap3WithoutAccount: View {
    
    @ObservedObject var groeiberekeningViewModel : GroeiberekeningViewModel
    
    @Binding var isFlowStarted: Bool
    
    @State var isGroeiberekeningResultaatPresented: Bool = false
    
    @State var weightText: String = ""
    @State var weight: Double = 0
    
    @State var showingErrorAlert: Bool = false
    
    var body: some View {
        ZStack {
            TopCurve(title: "Groeiberekening")
            VStack {
                HStack {
                    ZStack{
                        Circle()
                            .stroke(Color.ASMgreen, lineWidth: 3)
                            .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text("1")
                            .foregroundColor(.ASMgreen)
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
                            .fill(Color.ASMgreen)
                            .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text("3")
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                HStack {
                    Image("Weegschaal")
                        .padding(.leading)
                    
                    VStack(alignment: .leading){
                        Text("Schoenen uit, lichte sportkleding aan")
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Gewicht in kg")
                        .padding(.bottom, -7.0)
                    TextField("", text: $weightText)
                        .keyboardType(.numberPad)
                        .frame(width: 330.0, height: 50.0)
                        .background(Color("InputFieldLightGrey"))
                        .border(Color("BorderGrey"), width: 1)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                }
                
                Button(action: {
                    weight = (weightText as NSString).doubleValue
                    groeiberekeningViewModel.weight = weight
                    
                    groeiberekeningViewModel.sendGroeiberekeningRequest()
                    
                    self.showingErrorAlert.toggle()
                }, label: {
                    Text("Bereken")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .foregroundColor(.white)
                })
                .frame(width: 335.0, height: 45.0)
                .background(Color.ASMgreen)
                .cornerRadius(8.0)
                .alert(isPresented: $showingErrorAlert) {
                    Alert(title: Text(groeiberekeningViewModel.alertTitle), message: Text(groeiberekeningViewModel.alertMessage), dismissButton: .default(Text("Verder"), action: { if(groeiberekeningViewModel.alertTitle == "Je groei word berekend!") {self.isGroeiberekeningResultaatPresented = true}}))
                }
                .fullScreenCover(isPresented: $isGroeiberekeningResultaatPresented) {
                    GroeiberekeningResultaat(groeiberekeningViewModel: groeiberekeningViewModel)
                }
            }
        }
    }
}

//struct Groeiberekeningstap3WithoutAccount_Previews: PreviewProvider {
//    static var previews: some View {
//        Groeiberekeningstap3WithoutAccount()
//    }
//}
