//
//  NSDateExtensions.swift
//  WithMe-Mobile
//
//  Created by Justin WithMe on 1/9/17.
//  Copyright © 2017 WithMe. All rights reserved.
//

import Foundation

extension NSDate {

    // MARK: Intervals In Seconds
    private static func minuteInSeconds() -> Double { return 60 }
    private static func hourInSeconds() -> Double { return 3600 }
    private static func dayInSeconds() -> Double { return 86400 }
    private static func weekInSeconds() -> Double { return 604800 }
    private static func yearInSeconds() -> Double { return 31556926 }

    func formatDate(format: String = "MM/dd/yyy") -> String {
    //        let locale = NSLocale(localeIdentifier: "en_US_POSIX")
    //        let dateFormat = NSDateFormatter.dateFormatFromTemplate(format, options: 0, locale: locale)
    //        let dateForma
    //        formatter.date = "MMM d"
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }

    func formatDateWithTime() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm a"
        return formatter.stringFromDate(self)
    }
}
