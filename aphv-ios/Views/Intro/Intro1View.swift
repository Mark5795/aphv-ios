//
//  Intro1View.swift
//  aphv-ios
//
//  Created by Mark Kea on 08/12/2020.
//

import SwiftUI

struct Intro1View: View {
    @ObservedObject var introViewModel = IntroViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("Overslaan")
                    .padding(.trailing)
            }
            
            
            Image("SportendMeisje1")
                .padding(.top, 80.0)
            
            Text("Beter trainen")
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding(.top, 50.0)
            
            Text("Een simpele berekening die jou \nhelpt nog beter te worden \nin jouw sport!")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.top, 20.0)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Group {
                    Circle()
                        .fill(Color.ASMdarkGreen)
                        .frame(width: 14, height: 14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Circle()
                        .fill(Color.ASMgreen)
                        .frame(width: 14, height: 14, alignment: .center)
                    Circle()
                        .fill(Color.ASMgreen)
                        .frame(width: 14, height: 14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                    .frame(width: 90)
                
                Button(action: {self.introViewModel.pageIndex = 2}, label: {
                    Image("Arrow-ASMgreen")
                        .padding(.trailing, 50.0)
                })
            }
            .padding(.bottom, 30.0)
        }
    }
}

struct Intro1View_Previews: PreviewProvider {
    static var previews: some View {
        Intro1View()
    }
}
