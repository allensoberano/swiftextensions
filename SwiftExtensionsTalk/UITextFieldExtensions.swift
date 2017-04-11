//
//  UITextFieldExtensions.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setPlaceholderText(with text: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString (string: text, attributes: [NSForegroundColorAttributeName: color])
    }
    
    func setStandard() {
//        switch brand {
//        case .Associate:
//            self.borderStyle  = .None
//            self.backgroundColor = UIColor.whiteColor()
//            
//            let paddingView = UIView(frame: CGRectMake(0, 0, 20, 20))
//            self.leftView = paddingView
//            self.leftViewMode = UITextFieldViewMode.Always
//            
//            break;
//            
//        case .Core:
            self.borderStyle = .none
            self.addBorder(UIColor.lightGray, thickness: 1.0, borderType: .bottom)
//            break;
//        case .Shopper:
//            self.textColor = UIColor.whiteColor()
//            break;
//        }
    }
    
    /**
     Sets the text field to white
     
     - parameter textField: UITextField to apply style to
     */
    func setForDarkBackground() {
        self.borderStyle = .none
        self.addBorder(UIColor.lightGray, thickness: 1.0, borderType: .bottom)
        self.textColor = UIColor.white
    }
    
    func setForDarkBackground(_ withPlaceholderText: String, color: UIColor = UIColor.appTextSecondary) {
        self.borderStyle = .none
        self.addBorder(UIColor.lightGray, thickness: 1.0, borderType: .bottom)
        self.textColor = UIColor.white
        
        self.attributedPlaceholder = NSAttributedString (string: withPlaceholderText, attributes: [NSForegroundColorAttributeName: color])
    }
    
}
