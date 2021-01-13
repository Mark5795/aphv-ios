//
//  QRcodeScanner.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

// need to add: error handling

import SwiftUI
import AVFoundation
import CarBode

struct QRcodeScanner: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var sporterToCoachesViewModel = SporterToCoachesViewModel(userModel: UserModel())
    
    var body: some View {
        CBScanner(
            supportBarcode: .constant([.qr, .code128]), //Set type of barcode you want to scan
            scanInterval: .constant(5.0), //Event will trigger every 5 seconds
            mockBarCode: .constant(BarcodeData(value:"markcoach@gmail.com", type: .qr))
        ){
            //When you click the button on screen mock data will appear here
            print("BarCodeType =",$0.type.rawValue, " Value =",$0.value)
            sporterToCoachesViewModel.AddCoach(emailCoach: $0.value)
            presentationMode.wrappedValue.dismiss()
            
        }
    }
}
