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
                
                if model.favourites().count > 0 {
                    Button("Next", action: next)
                        .buttonStyle(InspireMeButtonStyle(scheme: scheme))
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Favourites", displayMode: .inline)
    }
    
    func author() -> String {
        if (currentIndex >= model.favourites().count) {
            return model.defaultEntry().author
        }
        
        return model.favourites()[currentIndex].author
    }
    
    func quote() -> String {
        if (currentIndex >= model.favourites().count) {
            return model.defaultEntry().text
        }
        
        return model.favourites()[currentIndex].text
    }
    
    func favourite() -> Bool {
        if (currentIndex >= model.favourites().count) {
            return model.defaultEntry().favourite
        }
        
        return model.favourites()[currentIndex].favourite
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
    
    func isLoved() -> Bool {
        if (currentIndex >= model.favourites().count) {
            return model.defaultEntry().favourite
        }
        
        return model.favourites()[self.currentIndex].favourite == true
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
