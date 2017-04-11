//
//  UIFont+Appearance.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    enum AppFont: String {
        case standard = "AzoSans-Regular"
        case bold = "AzoSans-Medium"
        case light = "AzoSans-Light"
        case italic = "AzoSans-Italic"
    }
    
    convenience init!(appFont: AppFont) {
        self.init(name: appFont.rawValue, size: UIFont.systemFontSize)
    }
    
    convenience init!(appFont: AppFont, size: CGFloat) {
        self.init(name: appFont.rawValue, size: size)
    }
    
}
