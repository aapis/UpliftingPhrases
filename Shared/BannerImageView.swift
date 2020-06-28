//
//  BannerImage.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct BannerImageView: View {    
    var body: some View {
        ZStack {
              // commented out until images can be set by the user
//            Image("alt_banner")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
            let scheme = ColourScheme()
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: scheme.current), startPoint: .top, endPoint: .bottom))
                .opacity(0.6)
            
            VStack {
                HStack {
                    Text("Daily Inspiration")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            
                HStack {
                    Text(_date: Date())
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .offset(y: -20)
                        .padding()
                    Spacer()
                }
            }
            .offset(y: -20)
        }
        .offset(y: -50)
        .frame(height: 300)
    }    
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImageView()
    }
}
