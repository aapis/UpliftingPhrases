//
//  ColourScheme.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import Foundation
import SwiftUI

struct LGradient {
    public var start: Color
    public var end: Color
    
    public func toArray() -> [Color] {
        let array: [Color] = [
            start,
            end
        ]
        
        return array
    }
}

struct ColourScheme {
    @Environment(\.colorScheme) var displayMode
    
    public var gradient: [Color] = LGradient(start: Color.white, end: Color.white).toArray()
    public var highlight: Color = Color.white
    
    private var hour: Int = 0
    
    init() {
        let date = Date()
        let calendar = Calendar.current
//        let timer = Timer.publish(every: 3600, on: .main, in: .common).autoconnect()

        hour = calendar.component(.hour, from: date)
//        hour = 23
//        timer.
        
        if isMorning() {
            gradient = LGradient(start: Color.blue, end: Color.pink).toArray()
            highlight = Color.pink
        }
        
        if isMidDay() {
            gradient = LGradient(start: Color.yellow, end: Color.red).toArray()
            highlight = Color.red
        }
        
        if isAfternoon() {
            gradient = LGradient(start: Color.white, end: Color.yellow).toArray()
            highlight = Color.orange
        }
        
        if isEvening() {
            gradient = LGradient(start: Color.purple, end: Color.blue).toArray()
            highlight = Color.purple
        }
        
        if isNight() {
            gradient = LGradient(start: Color.purple, end: Color.black).toArray()
            highlight = Color.purple
        }
    }
    
    func test() {
        print("hello world")
    }
    
    func isMorning() -> Bool {
        return hour >= 0 && hour < 8
    }
    
    func isMidDay() -> Bool {
        return hour >= 9 && hour <= 12
    }
    
    func isAfternoon() -> Bool {
        return hour >= 13 && hour <= 18
    }
    
    func isEvening() -> Bool {
        return hour >= 19 && hour <= 21
    }
    
    func isNight() -> Bool {
        return hour >= 22 && hour < 24
    }
}
