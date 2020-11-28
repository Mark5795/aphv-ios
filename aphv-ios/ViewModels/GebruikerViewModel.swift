//
//  GebruikerViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 24/11/2020.
//

import SwiftUI

struct GebruikerViewModel: Identifiable {
    let id = UUID()
    
    let gebruikerModel: GebruikerModel
    
    init(gebruikerModel: GebruikerModel) {
        self.gebruikerModel = gebruikerModel
    }

}
