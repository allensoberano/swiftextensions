//
//  NSDateExtensions.swift
//
//  Created by Justin WithMe on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation

extension Date {

    // MARK: Intervals In Seconds
    fileprivate static func minuteInSeconds() -> Double { return 60 }
    fileprivate static func hourInSeconds() -> Double { return 3600 }
    fileprivate static func dayInSeconds() -> Double { return 86400 }
    fileprivate static func weekInSeconds() -> Double { return 604800 }
    fileprivate static func yearInSeconds() -> Double { return 31556926 }

    func formatDate(_ format: String = "MM/dd/yyy") -> String {
    //        let locale = NSLocale(localeIdentifier: "en_US_POSIX")
    //        let dateFormat = NSDateFormatter.dateFormatFromTemplate(format, options: 0, locale: locale)
    //        let dateForma
    //        formatter.date = "MMM d"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }

    func formatDateWithTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm a"
        return formatter.string(from: self as Date)
    }
}
