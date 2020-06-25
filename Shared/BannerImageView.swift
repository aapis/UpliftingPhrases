//
//  BannerImage.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct BannerImageView: View {
    #if targetEnvironment(simulator)
    @State var userName = "Ryan"
    #else
    @State var userName = NSUserName()
    #endif
    
    var body: some View {
        ZStack {
            Image("alt_banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, .pink]), startPoint: .top, endPoint: .bottom))
                .opacity(0.6)
        }
        .offset(y: -50)
        .frame(height: 400)
//        .padding(.bottom, -160)
    }
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImageView()
    }
}
