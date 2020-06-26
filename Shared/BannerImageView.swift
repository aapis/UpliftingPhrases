//
//  BannerImage.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct BannerImageView: View {    
    var body: some View {
        ZStack {
              // commented out until images can be set by the user
//            Image("alt_banner")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: colours()), startPoint: .top, endPoint: .bottom))
                .opacity(0.6)
            
            VStack {
                HStack {
                    Text("Daily Inspiration")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            
                HStack {
                    Text(_date: Date())
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .offset(y: -20)
                        .padding()
                    Spacer()
                }
            }
            .offset(y: -20)
        }
        .offset(y: -50)
        .frame(height: 300)
    }
    
    func colours() -> [Color] {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        var bounds: [Color] = []
        
        if hour > 0 && hour < 8 {
            bounds = morning()
        } else if hour > 8 && hour < 12 {
            bounds = midDay()
        } else if hour > 12 && hour < 18 {
            bounds = afternoon()
        } else if hour > 18 && hour < 21 {
            bounds = evening()
        } else {
            bounds = night()
        }
        
        return bounds
        
    }
    
    private func morning() -> [Color] {
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

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImageView()
    }
}
