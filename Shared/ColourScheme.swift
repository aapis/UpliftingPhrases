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
    public var gradient: [Color] = LGradient(start: Color.white, end: Color.white).toArray()
    public var background: Color = Color.white
    public var text: Color = Color.white
    public var button: [Color] = LGradient(start: Color.white, end: Color.white).toArray()
    
    private var hour: Int = 0
    
    init() {
        let date = Date()
        let calendar = Calendar.current
//        let timer = Timer.publish(every: 3600, on: .main, in: .common).autoconnect()

        hour = calendar.component(.hour, from: date)
        
//        timer.
        
        if isMorning() {
            gradient = LGradient(start: Color.blue, end: Color.pink).toArray()
            background = Color.clear
            text = Color.red
            button = gradient.reversed()
        }
        
        if isMidDay() {
            gradient = LGradient(start: Color.yellow, end: Color.red).toArray()
            background = Color.clear
            text = Color.red
            button = gradient.reversed()
        }
        
        if isAfternoon() {
            gradient = LGradient(start: Color.white, end: Color.yellow).toArray()
            background = Color.clear
            text = Color.orange
            button = gradient.reversed()
        }
        
        if isEvening() {
            gradient = LGradient(start: Color.purple, end: Color.blue).toArray()
            background = Color.clear
            text = Color.red
            button = gradient.reversed()
        }
        
        if isNight() {
            gradient = LGradient(start: Color.blue, end: Color.black).toArray()
            background = Color.clear
            text = Color.red
            button = gradient.reversed()
        }
    }
    
    func test() {
        print("hello world")
    }
    
    func isMorning() -> Bool {
        return hour >= 0 && hour < 8
    }
    
    func isMidDay() -> Bool {
        return hour >= 8 && hour <= 12
    }
    
    func isAfternoon() -> Bool {
        return hour >= 12 && hour <= 18
    }
    
    func isEvening() -> Bool {
        return hour >= 18 && hour <= 21
    }
    
    func isNight() -> Bool {
        return hour >= 0 && hour < 8
    }
}
