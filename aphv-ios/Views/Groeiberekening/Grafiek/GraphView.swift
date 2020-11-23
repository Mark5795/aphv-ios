//
//  GraphView.swift
//  aphv-ios
//
//  Created by Mark Kea on 20/11/2020.
//

import SwiftUI

struct GraphView: View {
    @EnvironmentObject var manager: GrafiekManager
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(height: 360)
                .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
            
            HStack {
                // scale view
                GroeiScaleView()
                    .offset(x: 10, y : -12)
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            // data graph
                            MeerdereGrafiekenView()
                            // view for selecting individual graph hour item value
//                            GraphItemSelectionView()
                        }
                        .frame(height: 300)
                        // hour item
                        LeeftijdItemView()
                    }
                }
            }
        }
    }
}

struct GroeiScaleView: View {
    var body: some View {
        VStack {
            Text("10")
                .frame(width: 60, height: 50, alignment: .bottomLeading)
            
            Text("8")
                .frame(width: 60, height: 50, alignment: .bottomLeading)
            
            Text("6")
                .frame(width: 60, height: 50, alignment: .bottomLeading)
            
            Text("4")
                .frame(width: 60, height: 50, alignment: .bottomLeading)
            
            Text("2")
                .frame(width: 60, height: 50, alignment: .bottomLeading)
            
            Text("0")
                .frame(width: 60, height: 50, alignment: .bottomLeading)
        }
        .font(.system(size: 12))
    }
}
