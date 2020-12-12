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
    
    @State var pageIndex = 0
    
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
    
    //Get pageIndex from the viewModel
    func pageView(_ page: Int) -> some View {
        let introViews = introViewModel.pageIndex
        switch introViews {
        case 0:
            return AnyView(Intro1View(introViewModel : self.introViewModel))
        case 1:
            return AnyView(Intro2View(introViewModel : self.introViewModel))
        case 2:
            return AnyView(Intro3View(introViewModel : self.introViewModel))
        case 3:
            return AnyView(MainPagerView())
        default:
            return AnyView(Intro1View(introViewModel : self.introViewModel))
        }
    }
}

struct IntroPagerView_Previews: PreviewProvider {
    static var previews: some View {
        IntroPagerView()
    }
}