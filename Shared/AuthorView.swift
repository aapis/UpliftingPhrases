//
//  AuthorView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct AuthorView: View {
    var key: String
    
    var body: some View {
        Image(self.key)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4), alignment: .center)
            .shadow(radius: 10)
            .frame(width: 100)
            .padding()
    }
}

#if DEBUG
struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView(key: "Oscar Wilde")
    }
}
#endif
