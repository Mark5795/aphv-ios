//
//  Groeiberekeningstap3WithoutAccount.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI

struct Groeiberekeningstap3WithoutAccount: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel
    
    @State var zithoogte: String = ""
    
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
                            .fill(Color.ASMgreen)
                            .frame(width: 40, height: /*@START_MENU_TOKEN@*/40/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text("2")
                            .foregroundColor(.white)
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
                    Image("ZithoogteMannetje")
                        .padding(.leading, 100.0)
                    
                    VStack(alignment: .leading){
                        Text("Kijk recht vooruit")
                            .frame(height: 50)
                        
                        Text("Ontspan je schouders")
                        
                        Text("Ga met je rug recht tegen de muur aan zitten")
                            .frame(width: 175, height: 100)
                            .padding(.leading, -10)
                    }
                    .padding(.leading, -175)
                    .padding(.top, -125)
                    .frame(width: 210.0)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Zithoogte in cm")
                        .padding(.bottom, -7.0)
                    TextField("", text: $zithoogte)
                        .keyboardType(.numberPad)
                        .frame(width: 330.0, height: 50.0)
                        .background(Color("InputFieldLightGrey"))
                        .border(Color("BorderGrey"), width: 1)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                }
                
                Button(action: {self.groeiberekeningWithoutAccountViewModel.pageIndex = 4}, label: {
                    Text("Stap 3")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                })
                .frame(width: 335.0, height: 45.0)
                .background(Color("ASMgreen"))
                .cornerRadius(5)
            }
        }
    }
}

struct Groeiberekeningstap3WithoutAccount_Previews: PreviewProvider {
    static var previews: some View {
        Groeiberekeningstap3WithoutAccount(groeiberekeningWithoutAccountViewModel : GroeiberekeningWithoutAccountViewModel())
    }
}
