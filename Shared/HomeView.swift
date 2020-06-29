//
//  HomeView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ContentView(data: Quotes)) {
                    Text("All")
                }
                
                NavigationLink(destination: FavouritesView(data: Favourites)) {
                    Text("Favourites")
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
