//
//  MeerdereGrafiekenView.swift
//  aphv-ios
//
//  Created by Mark Kea on 20/11/2020.
//

import SwiftUI

struct MeerdereGrafiekenView: View {
    @EnvironmentObject var manager: GrafiekManager
    var body: some View {
        ZStack {
            // Line graph for all 3 activity
            LineGraph(data: getCaloriesFromData(data: manager.activities[0].grafiekData))
                .stroke(manager.selectedActivityIndex == 0 ? Color.blue : Color.gray.opacity(0.3), lineWidth: manager.selectedActivityIndex == 0 ? 4 : 3)
            
            LineGraph(data: getCaloriesFromData(data: manager.activities[1].grafiekData))
                .stroke(manager.selectedActivityIndex == 1 ? Color.blue : Color.gray.opacity(0.3), lineWidth: manager.selectedActivityIndex == 1 ? 4 : 3)
            
            // Filled line graph for selected activity
            LineGraph(data: getCaloriesFromData(data: manager.activities[manager.selectedActivityIndex].grafiekData))
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue.opacity(0.01)]),
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
    }
    
    func getCaloriesFromData(data: [GroeiberekeningResultaatData]) -> [CGFloat] {
        var calories: [CGFloat] = []
        
        for item in data {
            calories.append(item.waarde)
        }
        
        return calories
    }
}

struct LeeftijdItemView: View {
    var body: some View {
        HStack(spacing: 40) {
            ForEach(Data.valueItems[0].grafiekData) { data in
                Text("\(data.leeftijd)")
                    .frame(width: 25, alignment: .center)
            }
        }
        .font(.system(size: 12))
    }
}
