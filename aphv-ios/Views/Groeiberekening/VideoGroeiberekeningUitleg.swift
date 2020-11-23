//
//  VideoGroeiberekeningUitleg.swift
//  aphv-ios
//
//  Created by Mark Kea on 13/11/2020.
//

import SwiftUI
import AVKit

struct VideoGroeiberekeningUitleg: View {
    var body: some View {
        
        ZStack {
            TopCurve(title: "Uitleg Groeiberekening")
            
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "UitlegGroeiberekeningResultaten", withExtension: "mp4")!))
        }
    }
}

struct VideoGroeiberekeningUitleg_Previews: PreviewProvider {
    static var previews: some View {
        VideoGroeiberekeningUitleg()
    }
}
