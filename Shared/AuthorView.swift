//
//  AuthorView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct AuthorView: View {
    var scheme: ColourScheme
    var name: String
    
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .frame(width: 130, height: 130)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 6), alignment: .center)
                .shadow(radius: 10)
                .padding()
            
            Text(name)
                .font(.title)
                .foregroundColor(scheme.highlight)
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AuthorView(scheme: ColourScheme(), name: "Martin Luther King Jr.")
            AuthorView(scheme: ColourScheme(), name: "Maya Angelou")
            AuthorView(scheme: ColourScheme(), name: "Mahatma Gandhi")
            AuthorView(scheme: ColourScheme(), name: "Oscar Wilde")
            AuthorView(scheme: ColourScheme(), name: "Eleanor Roosevelt")
            AuthorView(scheme: ColourScheme(), name: "William W. Purkey")
        }
    }
}
