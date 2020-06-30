//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: QuotesModel
    
    @State var currentIndex: Int = 0
    @State var scheme: ColourScheme = ColourScheme()
    
    var body: some View {
        return VStack {
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
                    
            }
        }
        .navigationBarTitle("All Quotes", displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: love) {
                HStack {
                    Image(systemName: isLoved() ? "heart.fill" : "heart")
                        .accentColor(.pink)
                }
            }
        )
    }
    
    func author() -> String {
        model.all()[currentIndex].author
    }
    
    func quote() -> String {
        model.all()[currentIndex].text
    }
    
    func favourite() -> Bool {
        model.all()[currentIndex].favourite
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
        return Int.random(in: 0..<model.all().count)
    }
    
    func love() -> Void {
        let current = model.all()[self.currentIndex]
        
        if current.favourite {
            model.list[self.currentIndex].favourite = false
        } else {
            model.list[self.currentIndex].favourite = true
        }
    }
    
    func isLoved() -> Bool {
        return model.all()[self.currentIndex].favourite == true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
