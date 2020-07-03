//
//  DeviceHelper.swift
//  iOS
//
//  Created by Ryan Priebe on 2020-07-02.
//

import SwiftUI
import Foundation

class DeviceHelper {
    private let device: UIDevice = UIDevice.current
    
    public static func isiPad() -> Bool {
        let helper = DeviceHelper()
        
        return helper.device.model == "iPad"
    }
    
    public static func isiPhone() -> Bool {
        let helper = DeviceHelper()
        
        return helper.device.model == "iPhone"
    }
    
    public static func isLandscape() -> Bool {
        let helper = DeviceHelper()
        
        return helper.device.orientation.isLandscape
    }
}
