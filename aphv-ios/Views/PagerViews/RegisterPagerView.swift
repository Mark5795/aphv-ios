//
//  RegisterPagerView.swift
//  aphv-ios
//
//  Created by Mark Kea on 11/12/2020.
//

import SwiftUI
import SwiftUIPager
import Combine

struct RegisterPagerView: View {
    @ObservedObject var registerViewModel = RegisterViewModel()
    
    //to get no errors, temporary
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
//            .itemSpacing(10)
//            .navigationBarTitle("SwiftUIPager", displayMode: .inline)
        }
//        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    //Get pageIndex from the viewModel
    func pageView(_ page: Int) -> some View {
        let introViews = registerViewModel.pageIndex
        switch introViews {
        case 0:
            return AnyView(RegisterChooseRole(registerViewModel : self.registerViewModel))
        case 1:
            return AnyView(RegisterSporterView(registerViewModel : self.registerViewModel))
        case 2:
            return AnyView(RegisterCoachView(registerViewModel : self.registerViewModel))
        default:
            return AnyView(RegisterChooseRole(registerViewModel : self.registerViewModel))
        }
    }
}
struct RegisterPagerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPagerView()
    }
}
