//
//  TestTopCurve.swift
//  aphv-ios
//
//  Created by Mark Kea on 15/01/2021.
//

import SwiftUI

struct TestTopCurve: View {
    
    var title: String
    @Binding var showMenu: Bool
    var showHamburgerMenu : Bool = false
    
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
                
                if(showHamburgerMenu) {
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    .position(x: 30, y: 45)
                }
    }
}

struct TestTopCurve1: Shape {
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

struct TestTopCurve2: Shape {
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


struct TestTopCurve_Previews: PreviewProvider {
    static var previews: some View {
        TestTopCurve(title: "TestTitle", showMenu: .constant(true))
    }
}
