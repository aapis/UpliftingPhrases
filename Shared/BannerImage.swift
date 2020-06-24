//
//  BannerImage.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct BannerImage: View {
    var body: some View {
        VStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack {
                Text("Uplifting Phrases")
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .offset(y: -70)
                    .padding()
                
                Spacer()
            }
        }
        
    }
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImage()
    }
}
