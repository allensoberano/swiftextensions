//
//  UIButton+Appearance.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 8/9/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    
    /// Button with a white background and black text
    func setBlack() {
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.borderColor = UIColor.blackColor()
        self.borderWidth = 1
    }
    
    
    /// Button with a black background and white text
    func setBlackSelected() {
        self.backgroundColor = UIColor.blackColor()
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func setLightBlack() {
        self.backgroundColor = UIColor.appThunder
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func setLightGray() {
        self.backgroundColor = UIColor.appCoreLightGray
        self.setTitleColor(UIColor.appThunder, forState: .Normal)
    }
    
    func setDarkBlue() {
        self.backgroundColor = UIColor.appCoreBlue
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func setSecondaryBlue() {
        self.backgroundColor = UIColor.appCoreSecondaryBlue
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func setDisabled() {
        self.enabled = false
        self.backgroundColor = UIColor.appCoreDisabled
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.titleLabel!.font = UIFont(appFont: .bold, size: self.titleLabel!.font.pointSize)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appCoreDisabled.CGColor
    }
    
    func setDisabledForDarkBackground() {
        self.enabled = false
        self.backgroundColor = UIColor.clearColor()
        self.setTitleColor(UIColor.appCharcoal, forState: .Normal)
        self.titleLabel!.font = UIFont(appFont: .bold, size: self.titleLabel!.font.pointSize)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appCharcoal.CGColor
    }
    
    /// Button with a blue background and white text
    func setStandard() {
        self.backgroundColor = UIColor.appButtonDefault
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.enabled = true
    }
    
    
    /// Button with a clear background and white text
    func setClear() {
        self.backgroundColor = UIColor.clearColor()
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.enabled = true
        self.addBorder(UIColor.whiteColor(), thickness: 1, borderType: .all)
    }
    
    /// Button with a red background and white text
    func setRed() {
        self.backgroundColor = UIColor.redColor()
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.enabled = true
        
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    
    /// Button with a white background and black text and a light gray border
    func setWhite() {
        self.enabled = true
        self.backgroundColor = UIColor.whiteColor()
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        self.addBorder(UIColor.lightGrayColor(), thickness: 1, borderType: .all)
    }
    
    func setWhiteForDarkBackground() {
        self.enabled = true
        self.backgroundColor = UIColor.clearColor()
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.addBorder(UIColor.whiteColor(), thickness: 1, borderType: .all)
    }
    
}
