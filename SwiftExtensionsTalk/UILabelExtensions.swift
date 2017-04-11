//
//  UILabelExtensions.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 9/14/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    
//    let systemDynamicFontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
//    let size = systemDynamicFontDescriptor.pointSize
//    let font = UIFont(name: "ArialHebrew-Bold", size: size)
    
//    dynamic var defaultFont: UIFont? {
//        get { return self.font }
//        set {
//            let size = self.font.pointSize
//            
//            let isBold = (self.font.fontDescriptor().symbolicTraits.rawValue & UIFontDescriptorSymbolicTraits.TraitBold.rawValue) > 0
//            
//            self.font = UIFont(appFont: .standard, size: size)
//            if isBold {
//                self.font = UIFont(appFont: .bold, size: size)
//            }
//            
//            
//            self.font = newValue
//        }
//    }
    
    
//    var substituteFontName: String {
//        get {
//            return self.font.fontName
//        }
//        set {
//            let isBold = (self.font.fontDescriptor().symbolicTraits.rawValue & UIFontDescriptorSymbolicTraits.TraitBold.rawValue) > 0
//            if !isBold {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//    
//    var substituteBoldFontName: String {
//        get {
//            return self.font.fontName
//        }
//        set {
//            let isBold = (self.font.fontDescriptor().symbolicTraits.rawValue & UIFontDescriptorSymbolicTraits.TraitBold.rawValue) > 0
//            
//            if isBold {
//                self.font = UIFont(name: newValue, size: self.font!.pointSize)
//            }
//        }
//    }
    
    func setForDarkBackground() {
        self.addBorder(color: UIColor.lightGray, thickness: 1.0, borderType: .bottom)
        self.textColor = UIColor.white
    }
    
    func setHeader() {
        // label.textColor = AppColors.coreTextColorBase
        self.font = UIFont(appFont: .bold, size: self.font.pointSize)
    }
    
    func setSubHeaderLabel() {
        // label.textColor = AppColors.secondaryText
    }
    
    func setBold() {
        self.font = UIFont(appFont: .bold, size: self.font.pointSize)
    }
    
    func setSecondary() {
        // label.textColor = AppColors.secondaryText
        self.font = UIFont(appFont: .standard, size: self.font.pointSize)
    }
    
    var currencyValue: Double {
        set {
            let formatter = NumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            
            self.text =  formatter.stringFromNumber(newValue) // "$123.44"
        }
        get {
            return 0
        }
    }
}
