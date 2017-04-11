//
//  NSUserDefaultsExtensions.swift
//
//  Created by Justin Holman on 14/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    var alertSettings: [String] {
        get {
            if let value = UserDefaults.standard.value(forKey: "alertSettings") as? [String] {
                
                return value
            }
            return [String]()
        }
        set (value) {
            UserDefaults.standard.set(value, forKey: "alertSettings")
            UserDefaults.standard.synchronize()
        }
    }
    
    var selectedStores: [String] {
        get {
            if let value = UserDefaults.standard.value(forKey: "selectedStores") as? [String] {
                
                return value
            }
            return [String]()
        }
        set (value) {
            UserDefaults.standard.set(value, forKey: "selectedStores")
            UserDefaults.standard.synchronize()
        }
    }
    
}
