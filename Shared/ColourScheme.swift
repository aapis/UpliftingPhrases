//
//  ColourScheme.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import Foundation
import SwiftUI

struct ColourScheme {
    var current: [Color] {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour >= 0 && hour < 8 {
            return morning()
        } else if hour >= 8 && hour <= 12 {
            return midDay()
        } else if hour >= 12 && hour <= 18 {
            return afternoon()
        } else if hour >= 18 && hour <= 21 {
            return evening()
        } else {
            return night()
        }
    }
    
    func morning() -> [Color] {
        var val: [Color] = []
        
        val.append(Color.blue)
        val.append(Color.pink)
        
        return val
    }
    
    private func midDay() -> [Color] {
        var val: [Color] = []
        
        val.append(Color.yellow)
        val.append(Color.red)
        
        return val
    }
    
    private func afternoon() -> [Color] {
        var val: [Color] = []
        
        val.append(Color.white)
        val.append(Color.yellow)
        
        return val
    }
    
    private func evening() -> [Color] {
        var val: [Color] = []
        
        val.append(Color.purple)
        val.append(Color.blue)
        
        return val
    }
    
    private func night() -> [Color] {
        var val: [Color] = []
        
        val.append(Color.blue)
        val.append(Color.black)
        
        return val
    }
}
