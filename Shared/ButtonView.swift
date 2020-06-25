//
//  ButtonView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct ButtonView: View {
    var author: String
    var quote: String
//    var index: Int
    
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Inspire Me", action: next)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                Spacer()
            }
        }
    }
    
    func next() -> Void {
        let lastIndex: Int = index
        index = chooseRandomIndex()
        
        // never show duplicate phrases
        if lastIndex == index {
            index = chooseRandomIndex()
        }
        
        quote = phrases[index].text
        author = phrases[index].author
    }
    
    func chooseRandomIndex() -> Int {
        return Int.random(in: 0..<phrases.count)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(author: self.author, quote: self.quote, index: self.currentIndex)
    }
}
