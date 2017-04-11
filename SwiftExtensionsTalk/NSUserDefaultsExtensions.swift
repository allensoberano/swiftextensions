//
//  NSUserDefaultsExtensions.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 10/21/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    
    var alertSettings: [String] {
        get {
            if let value = NSUserDefaults.standardUserDefaults().valueForKey("alertSettings") as? [String] {
                
                return value
            }
            return [String]()
        }
        set (value) {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: "alertSettings")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var selectedStores: [String] {
        get {
            if let value = NSUserDefaults.standardUserDefaults().valueForKey("selectedStores") as? [String] {
                
                return value
            }
            return [String]()
        }
        set (value) {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: "selectedStores")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
}
