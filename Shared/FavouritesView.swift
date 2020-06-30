//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var model: QuotesModel
    
    @State var currentIndex: Int = 0
    @State var scheme: ColourScheme = ColourScheme()
    
    var body: some View {
        VStack {
            BannerImageView(scheme: scheme)
            
            AuthorView(scheme: scheme, name: author())
                .offset(y: -150)
                .padding(.bottom, -130)

            QuoteView(scheme: scheme, quote: quote())
            
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
        .navigationBarTitle("All", displayMode: .inline)
    }
    
    func author() -> String {
        model.favourites()[currentIndex].author
    }
    
    func quote() -> String {
        model.favourites()[currentIndex].text
    }
    
    func favourite() -> Bool {
        model.favourites()[currentIndex].favourite
    }
    
    func next() -> Void {
        let lastIndex: Int = self.currentIndex
        self.currentIndex = chooseRandomIndex()
        
        // never show duplicate phrases
        if lastIndex == self.currentIndex {
            self.currentIndex = chooseRandomIndex()
        }
    }
    
    func chooseRandomIndex() -> Int {
        return Int.random(in: 0..<model.favourites().count)
    }
    
    func love() -> Void {
        let current = model.list[self.currentIndex]
        
        if current.favourite {
            model.list[self.currentIndex].favourite = false
        } else {
            model.list[self.currentIndex].favourite = true
        }
    }
    
    func isLoved() -> Bool {
        return model.list[self.currentIndex].favourite == true
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
