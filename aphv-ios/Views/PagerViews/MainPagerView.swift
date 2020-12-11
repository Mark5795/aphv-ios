//
//  MainPager.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI
import SwiftUIPager
import Combine

struct MainPagerView: View {
    @ObservedObject var mainViewModel = MainViewModel()
    
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
//            .navigationBarTitle("MainPager", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    //Get pageIndex from the viewModel
    func pageView(_ page: Int) -> some View {
        let introViews = mainViewModel.pageIndex
        switch introViews {
        case 0:
            return AnyView(LandingPage(mainViewModel : self.mainViewModel))
        case 1:
            return AnyView(RegisterPagerView())
        case 2:
            return AnyView(GroeiberekeningWithoutAccountPagerView())
        default:
            return AnyView(RegisterPagerView())
        }
    }
}

struct MainPagerView_Previews: PreviewProvider {
    static var previews: some View {
        MainPagerView()
    }
}
