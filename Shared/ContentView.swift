//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    @State var quote: String = phrases.first?.text ?? "Hello, world"
    @State var author: String = phrases.first?.author ?? "HAL 9000"
    
    var body: some View {
        VStack {
            BannerImage()
                .frame(height: 300)
                .offset(y: -60)
                .padding(.bottom, -60)
            
            VStack(alignment: .leading) {
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
                    Button("Inspire Me", action: loadAnother)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
            }
            .padding()
            
            Spacer()
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
