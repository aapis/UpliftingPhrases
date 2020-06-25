//
//  QuoteView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct QuoteView: View {
    var quote: String
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Text("\"" + quote + "\"")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "Hello")
    }
}
