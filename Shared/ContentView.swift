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
    
    var body: some View {
        VStack {
            BannerImageView()
            
            AuthorView(name: self.author)
                .offset(y: -160)
                .padding(.bottom, -130)
            
            QuoteView(quote: self.quote)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Inspire Me", action: next)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .offset(y: -40)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
