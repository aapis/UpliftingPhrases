//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    @State var quote: String = phrases.first?.text ?? "I can't do that"
    @State var author: String = phrases.first?.author ?? "HAL 9000"
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
            }
        }
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
}

struct InspireMeButtonStyle: ButtonStyle {
    @State var scheme: ColourScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 50, alignment: .center)
            .foregroundColor(Color.white)
            .background(scheme.highlight)
            .cornerRadius(40)
            .offset(y: -40)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scheme: ColourScheme())
    }
}
