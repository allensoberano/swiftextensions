//
//  NSDateFormatter.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 10/26/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation

extension NSDateFormatter {
    
    func convertDateFromApi(apiDate: String) -> NSDate! {
        self.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        self.timeZone = NSTimeZone(abbreviation: "UTC")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        return self.dateFromString(apiDate)!
    }

    func createDate(year: Int, month: Int, day: Int = 1) -> NSDate {
        self.dateFormat = "MM/dd/yyyy"
        
        return self.dateFromString("\(month)/\(day)/\(year)")!
    }
    
}
