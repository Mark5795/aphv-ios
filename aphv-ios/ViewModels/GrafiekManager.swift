//
//  GrafiekManager.swift
//  aphv-ios
//
//  Created by Mark Kea on 23/11/2020.
//

import SwiftUI

class GrafiekManager: ObservableObject {
    @Published var activities = Data.valueItems
    @Published var selectedActivityIndex = 0
    @Published var selectedBarIndex = -1
    
    func selectActivity(item: ValueItem) {
        if let activityIndex = activities.firstIndex(where: { $0.id == item.id }), selectedActivityIndex != activityIndex {
            activities[selectedActivityIndex].selected = false
            activities[activityIndex].selected = true
            
            if selectedBarIndex != -1 {
                activities[selectedActivityIndex].grafiekData[selectedBarIndex].selected.toggle()
                selectedBarIndex = -1
            }
            selectedActivityIndex = activityIndex
        }
    }
    
    func getCaloryDataForSelectedIndex() -> [GroeiberekeningResultaatData] {
        return activities[selectedActivityIndex].grafiekData
    }
    
    func selectBar(leeftijd: Int) {
        if let caloryBarIndex = getCaloryDataForSelectedIndex().firstIndex(where: { $0.leeftijd == leeftijd }) {
            activities[selectedActivityIndex].grafiekData[caloryBarIndex].selected.toggle()
            
            if selectedBarIndex != -1, selectedBarIndex != caloryBarIndex {
                activities[selectedActivityIndex].grafiekData[selectedBarIndex].selected = false
            }
            
            selectedBarIndex = caloryBarIndex
        }
    }
    
    func getSelectedActivityHour() -> Int {
        var leeftijd = 0
        
        if selectedBarIndex != -1 {
            leeftijd = activities[selectedActivityIndex].grafiekData[selectedBarIndex].leeftijd
        }
        return leeftijd
    }
    
    func getIsSelectedHourSelected() -> Bool {
        var selected = false
        
        if selectedBarIndex != -1 {
            selected = activities[selectedActivityIndex].grafiekData[selectedBarIndex].selected
        }
        return selected
    }
}
