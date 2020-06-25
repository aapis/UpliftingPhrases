//
//  AuthorView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct AuthorView: View {
    var authorName: String
    
    var body: some View {
        VStack {
            Image(self.authorName)
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 6), alignment: .center)
                .shadow(radius: 10)
                .padding()
            
            Text(self.authorName)
                .font(.title)
                .foregroundColor(.black)
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AuthorView(authorName: "Martin Luther King Jr.")
            AuthorView(authorName: "Maya Angelou")
            AuthorView(authorName: "Mahatma Gandhi")
            AuthorView(authorName: "Oscar Wilde")
            AuthorView(authorName: "Eleanor Roosevelt")
            AuthorView(authorName: "William W. Purkey")
        }
    }
}
