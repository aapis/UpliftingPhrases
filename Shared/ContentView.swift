//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct Quote {
    var text: String
    var author: String
}

var phrases = [
    Quote(text: "Be yourself; everyone else is already taken.", author: "Oscar Wilde"),
    Quote(text: "You've gotta dance like there's nobody watching, Love like you'll never be hurt, Sing like there's nobody listening, And live like it's heaven on earth.", author: "William W. Purkey"),
    Quote(text: "Be the change that you wish to see in the world.", author: "Mahatma Gandhi"),
    Quote(text: "No one can make you feel inferior without your consent.", author: "Eleanor Roosevelt"),
    Quote(text: "Live as if you were to die tomorrow. Learn as if you were to live forever.", author: "Mahatma Gandhi"),
    Quote(text: "Darkness cannot drive out darkness: only light can do that. Hate cannot drive out hate: only love can do that.", author: "Martin Luther King Jr."),
    Quote(text: "There is no greater agony than bearing an untold story inside you.", author: "Maya Angelou")
]

struct ContentView: View {
    @State var quote: String = phrases.first?.text ?? "Hello, world"
    @State var author: String = phrases.first?.author ?? "HAL 9000"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Uplifting Phrases")
                .font(.title)
                .padding()
            HStack {
                Text("\"" + quote + "\"")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text("-- " + author)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            VStack {
                Button("Give me another", action: loadAnother)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .padding()
            }
        }
    }
    
    func loadAnother() -> Void {
        let index: Int = Int.random(in: 0..<phrases.count);
        
        self.quote = phrases[index].text
        self.author = phrases[index].author
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
