//
//  IntroPagerView.swift
//  aphv-ios
//
//  Created by Mark Kea on 08/12/2020.
//

import SwiftUI
import SwiftUIPager
import Combine

struct IntroPagerView: View {
    @ObservedObject var introViewModel = IntroViewModel()
    
    @State var pageIndex = 1
    var pageIndex = introViewModel.$pageIndex
    
    var items = Array(0..<3)
        
    var body: some View {
        NavigationView {
            Pager(page: $pageIndex,
                  data: self.items,
                  id: \.self) {
                self.pageView($0)
            }
            .pagingPriority(.simultaneous)
            .itemSpacing(10)
            .navigationBarTitle("SwiftUIPager", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func pageView(_ page: Int) -> some View {
        let introViews = page

        switch introViews {
        case 0:
            return AnyView(Intro1View())
        case 1:
            return AnyView(Intro2View())
        default:
            return AnyView(Intro1View())
        }
    }
}

struct IntroPagerView_Previews: PreviewProvider {
    static var previews: some View {
        IntroPagerView()
    }
}
