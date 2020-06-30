//
//  Quotes.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import Foundation

var Quotes: [Quote] = load("Quotes.json")
var Favourites: [Quote] = Quotes.filter { $0.favourite == true }

class QuotesModel: ObservableObject {
    @Published var list: [Quote] = load("Quotes.json")
    
    public func favourites() -> [Quote] {
        return list.filter { $0.favourite == true }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
