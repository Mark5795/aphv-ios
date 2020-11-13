//
//  TopCurve.swift
//  aphv-ios
//
//  Created by Mark Kea on 13/11/2020.
//

import SwiftUI

struct TopCurve: View {
    
    var title: String
    
    var body: some View {
            ZStack() {
                TopCurve2()
                    .fill(Color("ASMlightGreen"))
                    .frame(width: 400.0, height: 80.0)
                    .rotationEffect(.degrees(2))
                    .position(x: 190, y: 33)
                
                TopCurve1()
                    .fill(Color("ASMgreen"))
                    .frame(width: 400.0, height: 80.0)
                    .overlay(Text(title)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.top, 40.0))
                                .position(x: 190, y: 25)
            }
            .edgesIgnoringSafeArea(.top)
    }
}

struct TopCurve1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + 50))
        path.closeSubpath()
        
        return path
    }
}

struct TopCurve2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + 50))
        path.closeSubpath()
        
        return path
    }
}
