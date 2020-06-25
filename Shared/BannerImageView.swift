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
            
            VStack {
                HStack {
                    Text("Daily Inspiration")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.pink)
                        .padding()
                    Spacer()
                }
            
                HStack {
                    Text(_date: Date())
                        .font(.subheadline)
                        .bold()
                        .offset(y: -20)
                        .padding()
                    Spacer()
                }
            }
            .offset(y: -90)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, .pink]), startPoint: .top, endPoint: .bottom))
                .opacity(0.6)
        }
        .offset(y: -50)
        .frame(height: 400)
    }
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImageView()
    }
}
