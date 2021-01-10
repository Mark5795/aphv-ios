//
//  QRcodeScanner.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import SwiftUI
import AVFoundation
import CarBode

struct QRcodeScanner: View {
    var body: some View {
        CBScanner(
            supportBarcode: .constant([.qr, .code128]), //Set type of barcode you want to scan
            scanInterval: .constant(5.0), //Event will trigger every 5 seconds
            mockBarCode: .constant(BarcodeData(value:"Mocking data", type: .qr))
        ){
            //When you click the button on screen mock data will appear here
            print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
        }
    }
}

struct QRcodeScanner_Previews: PreviewProvider {
    static var previews: some View {
        QRcodeScanner()
    }
}
