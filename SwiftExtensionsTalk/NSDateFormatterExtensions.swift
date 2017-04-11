//
//  NSDateFormatter.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func convertDateFromApi(_ apiDate: String) -> NSDate! {
        self.locale = Locale(identifier: "en_US_POSIX") as Locale!
        self.timeZone = TimeZone(abbreviation: "UTC")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        return self.date(from: apiDate)! as NSDate
    }

    func createDate(_ year: Int, month: Int, day: Int = 1) -> NSDate {
        self.dateFormat = "MM/dd/yyyy"
        
        return self.date(from: "\(month)/\(day)/\(year)")! as NSDate
    }
    
}
