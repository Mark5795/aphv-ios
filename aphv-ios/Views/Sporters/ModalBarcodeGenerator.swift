//
//  ModalBarcodeGenerator.swift
//  aphv-ios
//
//  Created by Mark Kea on 20/01/2021.
//

import SwiftUI
import CarBode

//Gets the email of the user and creates a QR code.

struct ModalBarcodeGenerator: View {
    

    @State var dataString = "no account"
    @State var barcodeType = CBBarcodeView.BarcodeType.qrCode
    @State var rotate = CBBarcodeView.Orientation.up
    
    @State var barcodeImage: UIImage?

    var body: some View {
        VStack {
            CBBarcodeView(data: $dataString,
                barcodeType: $barcodeType,
                orientation: $rotate)
                { image in
                    self.barcodeImage = image
                }.frame(maxWidth: 200, maxHeight: 200, alignment: .topLeading)
        }
    }
}

struct ModalBarcodeGenerator_Previews: PreviewProvider {
    static var previews: some View {
        ModalBarcodeGenerator()
    }
}
