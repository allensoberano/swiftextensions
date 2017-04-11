//
//  UIButton.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    
    /// Button with a white background and black text
    func setBlack() {
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.black, for: .normal)
//        self.borderColor = UIColor.black
//        self.borderWidth = 1
    }
    
    
    /// Button with a black background and white text
    func setBlackSelected() {
        self.backgroundColor = UIColor.black
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setLightBlack() {
        self.backgroundColor = UIColor.appThunder
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setLightGray() {
        self.backgroundColor = UIColor.appCoreLightGray
        self.setTitleColor(UIColor.appThunder, for: .normal)
    }
    
    func setDarkBlue() {
        self.backgroundColor = UIColor.appCoreBlue
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setSecondaryBlue() {
        self.backgroundColor = UIColor.appCoreSecondaryBlue
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setDisabled() {
        self.isEnabled = false
        self.backgroundColor = UIColor.appCoreDisabled
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel!.font = UIFont(appFont: .bold, size: self.titleLabel!.font.pointSize)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appCoreDisabled.cgColor
    }
    
    func setDisabledForDarkBackground() {
        self.isEnabled = false
        self.backgroundColor = UIColor.clear
        self.setTitleColor(UIColor.appCharcoal, for: .normal)
        self.titleLabel!.font = UIFont(appFont: .bold, size: self.titleLabel!.font.pointSize)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appCharcoal.cgColor
    }
    
    /// Button with a blue background and white text
    func setStandard() {
        self.backgroundColor = UIColor.appButtonDefault
        self.setTitleColor(UIColor.white, for: .normal)
        self.isEnabled = true
    }
    
    
    /// Button with a clear background and white text
    func setClear() {
        self.backgroundColor = UIColor.clear
        self.setTitleColor(UIColor.white, for: .normal)
        self.isEnabled = true
        self.addBorder(UIColor.white, thickness: 1, borderType: .all)
    }
    
    /// Button with a red background and white text
    func setRed() {
        self.backgroundColor = UIColor.red
        self.setTitleColor(UIColor.white, for: .normal)
        self.isEnabled = true
        
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    
    /// Button with a white background and black text and a light gray border
    func setWhite() {
        self.isEnabled = true
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.black, for: .normal)
//        self.addBorder(UIColor.lightGray, thickness: 1, borderType: .all)
    }
    
    func setWhiteForDarkBackground() {
        self.isEnabled = true
        self.backgroundColor = UIColor.clear
        self.setTitleColor(UIColor.white, for: .normal)
        self.addBorder(UIColor.white, thickness: 1, borderType: .all)
    }
    
}
