//
//  Intro2View.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/12/2020.
//

import SwiftUI

struct Intro2View: View {
    var body: some View {
        VStack(alignment: .center) {
         
            Image("SportendeJongen")
                .padding(.top, 100.0)
            
            Text("Deel met je coach")
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding(.top, 50.0)
            
            Text("Deel je resultaat met je coach \nzodat hij/zij je beter \nkunt trainen.")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.top, 20.0)
            
            Spacer()
            
            HStack {
                Image("Arrow-ASMgreen")
                    .padding(.trailing, 50.0)
                    .rotationEffect(.degrees(-180))
                
                Spacer()
                
                Group {
                    Circle()
                        .fill(Color.ASMgreen)
                        .frame(width: 14, height: 14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Circle()
                        .fill(Color.ASMdarkGreen)
                        .frame(width: 14, height: 14, alignment: .center)
                    Circle()
                        .fill(Color.ASMgreen)
                        .frame(width: 14, height: 14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                    .frame(width: 90)
                
                Image("Arrow-ASMgreen")
                    .padding(.trailing, 50.0)
            }
            .padding(.bottom, 30.0)
        }
    }
}

struct Intro2View_Previews: PreviewProvider {
    static var previews: some View {
        Intro2View()
    }
}

