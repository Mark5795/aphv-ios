//
//  GroeiberekeningWithoutAccountPagerView.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI
import SwiftUIPager
import Combine

struct GroeiberekeningWithoutAccountPagerView: View {
    
    @ObservedObject var groeiberekeningWithoutAccountViewModel = GroeiberekeningWithoutAccountViewModel()
    
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
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    //Get pageIndex from the viewModel
    func pageView(_ page: Int) -> some View {
        let introViews = groeiberekeningWithoutAccountViewModel.pageIndex
        switch introViews {
        case 0:
            return AnyView(ConsWithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
//        case 1:
//            return AnyView(GroeiberekeningIntroWithoutAccount(groeiberekeningWithoutAccountViewModel : self.introViewMgroeiberekeningWithoutAccountViewModelodel))
//        case 2:
//            return AnyView(Intro3View(introVgroeiberekeningWithoutAccountViewModeliewModel : self.groeiberekeningWithoutAccountViewModel))
        default:
            return AnyView(ConsWithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        }
    }
}

struct GroeiberekeningWithoutAccountPagerView_Previews: PreviewProvider {
    static var previews: some View {
        GroeiberekeningWithoutAccountPagerView(groeiberekeningWithoutAccountViewModel: GroeiberekeningWithoutAccountViewModel())
    }
}