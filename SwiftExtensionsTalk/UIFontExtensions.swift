//
//  UIFont+Appearance.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 9/12/16.
//  Copyright © 2016 WithMe. All rights reserved.
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
        self.init(name: appFont.rawValue, size: UIFont.systemFontSize())
    }
    
    convenience init!(appFont: AppFont, size: CGFloat) {
        self.init(name: appFont.rawValue, size: size)
    }
    
//    func standard() {
//        self.init(name: AppFont.bold.rawValue, size: 15)
//    }
}
