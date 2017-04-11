//
//  UIStringExtensions.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 10/14/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation

extension String {
    
    enum Associate: String {
        case headerProductDetails = "HEADER_PRODUCTDETAILS"
        case headerCart = "Header_Cart"
        case headerCartCustInfo = "Header_CartCustInfo"
        case headerCartPayment = "Header_CartPayment"
        case loadingRequests = "LoadingRequests"
        case headerAlertStoreSelector = "HeaderAlertStoreSelector"
    }
    
    static func localized(associate: Associate) -> String {
        return NSLocalizedString(associate.rawValue, comment: "")
    }
    
    var applicationDocumentDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    var length: Int {
        return self.characters.count
    }

    func digitsOnly() -> String {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).joinWithSeparator("")
    }

    func formatCurrency(dataToFormat: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.roundingMode = .RoundHalfEven
        
        return formatter.stringFromNumber(dataToFormat)!
    }

    func formatDate(dateToFormat: NSDate, format: String = "MM/dd/yyy") -> String {
        //        let locale = NSLocale(localeIdentifier: "en_US_POSIX")
        //        let dateFormat = NSDateFormatter.dateFormatFromTemplate(format, options: 0, locale: locale)
        //        let dateForma
        //        formatter.date = "MMM d"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(dateToFormat)
    }

    func formatDateWithTime(dateToFormat: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm a"
        return formatter.stringFromDate(dateToFormat)
    }

    /// Formats a string into a phone number
    ///
    /// - returns: Phone number in (xxx) xxx-xxxx format
    func formatPhone() -> String {
        let formattedPhone = NSMutableString(string: self.digitsOnly())
        
        if self.characters.count == 10 {
            formattedPhone.insertString("(", atIndex: 0)
            formattedPhone.insertString(")", atIndex: 4)
            formattedPhone.insertString(" ", atIndex: 5)
            formattedPhone.insertString("-", atIndex: 9)
        }
        
        return formattedPhone as String
    }
    
    func properCased() -> String {
        return String(self.characters.prefix(1)).uppercaseString + String(self.characters.dropFirst())
    }
    
    func trimed() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }

    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        return emailTest.evaluateWithObject(self)
    }

    var isValidPhone: Bool {

        if self.characters.count != 10 {
            return false
        }

        let phoneRegEx = "^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$"

        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)

        return phoneTest.evaluateWithObject(self)
    }

    //    func phoneNumberValidation(value: String) -> Bool {
    //        let charcter  = NSCharacterSet(charactersInString: "0123456789").invertedSet
    //        var filtered: NSString!
    //        let inputString: NSArray = value.componentsSeparatedByCharactersInSet(charcter)
    //        filtered = inputString.componentsJoinedByString("")
    //        return  value == filtered
    //    }


}
