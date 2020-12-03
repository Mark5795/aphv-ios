//
//  DropdownView.swift
//  aphv-ios
//
//  Created by Mark Kea on 30/11/2020.
//

import SwiftUI

struct DropDownView: View {
    @State var placeholder: String = ""
    @State var expand = false
    
    
    @Binding var gender : String
    
    var body: some View {
        VStack() {
            VStack() {
                HStack() {
                    Text(placeholder)
                    Spacer()
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(.black)
                }
                .frame(height: 25)
                .onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    Button(action: {
                        gender = "male"
                        placeholder = "Jongen"
                        self.expand.toggle()
                    }) {
                        Text("Jongen")
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                    Divider()
                    
                    Button(action: {
                        gender = "female"
                        placeholder = "Meisje"
                        self.expand.toggle()
                    }) {
                        Text("Meisje")
                            .padding()
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            .background(Color.InputFieldLightGrey)
            .border(Color.BorderGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
            .animation(.spring())
        }
    }
}
    
//    enum Gender: String {
//        case Male = "Jongen"
//        case Female = "Meisje"
//    }
//
//    struct DropDownButtonGroups: View {
//        let callback: (String) -> ()
//
//        @State var selectedId: String = ""
//
//        var body: some View {
//            HStack {
//                buttonMaleMajority
//                buttonFemaleMajority
//            }
//        }
//
//        var buttonMaleMajority: some View {
//            RadioButtonFieldView(
//                id: Gender.Male.rawValue,
//                label: Gender.Male.rawValue,
//                isMarked: selectedId == Gender.Male.rawValue ? true : false,
//                callback: buttonGroupCallback
//            )
//        }
//
//        var buttonFemaleMajority: some View {
//            RadioButtonFieldView(
//                id: Gender.Female.rawValue,
//                label: Gender.Female.rawValue,
//                isMarked: selectedId == Gender.Female.rawValue ? true : false,
//                callback: buttonGroupCallback
//            )
//        }
//
//        func buttonGroupCallback(id: String) {
//            selectedId = id
//            callback(id)
//}
