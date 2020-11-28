//
//  CheckboxView.swift
//  aphv-ios
//
//  Created by Mark Kea on 26/11/2020.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var checked: Bool
    @Binding var trimVal : CGFloat
    
    var animateableData: CGFloat {
        get {trimVal}
        set {trimVal = newValue}
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.0, to: trimVal)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(width: 70, height: 70)
                .foregroundColor(checked ? Color.ASMgreen: Color.gray.opacity(0.2))
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.0, to: 1.0)
                .fill(checked ? Color.ASMgreen: Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
            if checked {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white)
            }
        }
    }

}
