//
//  Quote.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import SwiftUI

struct Quote: Hashable, Codable {
    var text: String
    var author: String
    var favourite: Bool
}
