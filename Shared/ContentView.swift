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
        .navigationBarTitle("All", displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: love) {
                HStack {
                    Image(systemName: isLoved() ? "heart.fill" : "heart")
                }
            }
        )
    }
    
    func author() -> String {
        model.list[currentIndex].author
    }
    
    func quote() -> String {
        model.list[currentIndex].text
    }
    
    func favourite() -> Bool {
        model.list[currentIndex].favourite
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
        return Int.random(in: 0..<model.list.count)
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

struct InspireMeButtonStyle: ButtonStyle {
    var scheme: ColourScheme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .frame(width: 300, height: 50, alignment: .center)
                .foregroundColor(Color.white)
                .background(scheme.highlight)
                .cornerRadius(40)
                .offset(y: -40)
                .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        }
    }
}

struct FavouriteButtonStyle: ButtonStyle {
    var scheme: ColourScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 50, alignment: .center)
            .foregroundColor(Color.white)
            .background(scheme.highlight)
            .cornerRadius(40)
            .offset(y: -40)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
