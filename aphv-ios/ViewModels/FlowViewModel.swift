//
//  FlowViewModel.swift
//  aphv-ios
//
//  Created by Mark Kea on 17/12/2020.
//

import SwiftUI
import Combine

class FlowViewModel: ObservableObject {
    @Published var isFlowStarted: Bool = false
}
