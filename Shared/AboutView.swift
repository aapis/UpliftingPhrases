//
//  AboutView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hi")
                NavigationLink(destination: ContentView()) {
                    Text("Go To Next Step")
                }
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
