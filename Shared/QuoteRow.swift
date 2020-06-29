//
//  QuoteRow.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import SwiftUI

struct QuoteRow: View {
    var quote: Quote
    var body: some View {
        HStack {
            Text("All")
        }
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        QuoteRow(quote: Quotes[0])
    }
}
