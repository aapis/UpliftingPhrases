//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct FavouritesView: View {
    var data: [Quote]
    
    @State var quote: String = phrases.first?.text ?? "I can't do that"
    @State var author: String = phrases.first?.author ?? "HAL 9000"
    @State var favourite: Bool = phrases.first?.favourite ?? false
    @State var currentIndex: Int = 0
    @State var scheme: ColourScheme = ColourScheme()
    
    var body: some View {
        VStack {
            BannerImageView(scheme: scheme)
            
            AuthorView(scheme: scheme, name: self.author)
                .offset(y: -150)
                .padding(.bottom, -130)

            QuoteView(scheme: scheme, quote: self.quote)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Inspire Me", action: next)
                    .buttonStyle(InspireMeButtonStyle(scheme: scheme))
                Spacer()
                
                Button(action: love) {
                    HStack {
                        Image(systemName: isLoved() ? "heart.fill" : "heart")
                    }
                }
                    
            }
        }
        .navigationBarTitle("Favourites", displayMode: .inline)
    }
    
    func next() -> Void {
        let lastIndex: Int = self.currentIndex
        self.currentIndex = chooseRandomIndex()
        
        // never show duplicate phrases
        if lastIndex == self.currentIndex {
            self.currentIndex = chooseRandomIndex()
        }
        
        self.quote = phrases[self.currentIndex].text
        self.author = phrases[self.currentIndex].author
    }
    
    func chooseRandomIndex() -> Int {
        return Int.random(in: 0..<phrases.count)
    }
    
    func love() -> Void {
        phrases[self.currentIndex].favourite = true
    }
    
    func isLoved() -> Bool {
        return phrases[self.currentIndex].favourite == true
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(data: Favourites)
    }
}
