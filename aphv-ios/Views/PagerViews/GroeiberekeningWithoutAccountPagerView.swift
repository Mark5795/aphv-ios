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
    
    var items = Array(0..<6)
    
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
        let introViews = groeiberekeningWithoutAccountViewModel.pageIndex
        switch introViews {
        case 0:
            return AnyView(ConsWithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        case 1:
            return AnyView(RegisterPagerView())
        case 2:
            return AnyView(GroeiberekeningIntroWithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        case 3:
            return AnyView(Groeiberekeningstap1WithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        case 4:
            return AnyView(Groeiberekeningstap2WithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        case 5:
            return AnyView(Groeiberekeningstap3WithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        case 6:
            return AnyView(Groeiberekeningstap4WithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
        case 7:
            return AnyView(Groeiberekeningstap4WithoutAccount(groeiberekeningWithoutAccountViewModel : self.groeiberekeningWithoutAccountViewModel))
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
