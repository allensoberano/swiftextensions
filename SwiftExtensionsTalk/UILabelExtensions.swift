//
//  UILabelExtensions.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    func setForDarkBackground() {
        self.addBorder(UIColor.lightGray, thickness: 1.0, borderType: .bottom)
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
            formatter.numberStyle = .currency
            self.text = formatter.string(from: NSNumber(value: newValue))
        }
        get {
            return 0
        }
    }
}
