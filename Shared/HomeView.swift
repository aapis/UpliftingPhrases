//
//  HomeView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
//            FeaturedQuoteView()
            ListView()
        }
        
    }
}

struct FeaturedQuoteView: View {
    var body: some View {
        Text("HELLO")
    }
}

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ContentView(data: Quotes)) {
                    HStack {
                        Image(systemName: "list.bullet")
                        Text("All")
                        Spacer()
                        Text("\(Quotes.count)")
                    }
                }
                
                NavigationLink(destination: FavouritesView(data: Favourites)) {
                    HStack {
                        Image(systemName: "heart")
                        Text("Favourites")
                        Spacer()
                        Text("\(Favourites.count)")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Daily Inspiration")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
