//
//  InputTextFieldView.swift
//  aphv-ios
//
//  Created by Mark Kea on 26/11/2020.
//

import SwiftUI

struct InputTextFieldView: View {
    
    @Binding var stateBinding: String
    
    let title: String
    let placeholder: String
    let secureTextField: Bool
    
    var body: some View {
        Text(title)
        TextField(placeholder, text: $stateBinding)
            .padding()
            .background(Color.InputFieldLightGrey)
            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
    }
}
