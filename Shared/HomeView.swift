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
    @EnvironmentObject var theme: Theme
//    @State var scheme: ColourScheme = ColourScheme()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ContentView()) {
                    HStack {
                        Image(systemName: "list.bullet")
                            .foregroundColor(theme.highlight)
                        Text("All Quotes")
                        Spacer()
                        Text("\(model.all().count)")
                    }
                }
                
                NavigationLink(destination: FavouritesView()) {
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(theme.highlight)
                        Text("Favourites")
                        Spacer()
                        Text("\(model.favourites().count)")
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Daily Inspiration")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
