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
    @EnvironmentObject var model: QuotesModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ContentView()) {
                    HStack {
                        Image(systemName: "list.bullet")
                        Text("All")
                        Spacer()
                        Text("\(model.list.count)")
                    }
                }
                
                NavigationLink(destination: FavouritesView()) {
                    HStack {
                        Image(systemName: "heart")
                        Text("Favourites")
                        Spacer()
                        Text("\(model.favourites().count)")
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
