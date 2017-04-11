//
//  UIView+Appearance.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 8/9/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    enum BorderType {
        case top,
        left,
        right,
        bottom,
        all
    }

    func addDropShadow(radius: CGFloat = 2) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.shadowOffset = CGSizeMake(1, 1)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 0.5
    }
    
    /**
     Allows view to partialy show the elements behind it
     
     - parameter baseColor: - color to use as the base (default is background color)
     - parameter transparencyValue: - (default is 0.8)
     */
    func addTransparency(baseColor: UIColor = UIColor.appBackgroundLight, transparencyValue: CGFloat = 0.8) {
        self.backgroundColor = baseColor.colorWithAlphaComponent(transparencyValue)
    }

    func drawLine(start start: CGPoint, toPoint end: CGPoint, ofColor lineColor: UIColor) -> CAShapeLayer {
        
        // design the path
        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        
        // design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
        return shapeLayer
    }
    
    func addBorder(color: UIColor, thickness: CGFloat, borderType: BorderType) {
        let bottomFrame = CGRectMake(0, self.frame.size.height-thickness, self.frame.size.width, thickness)
        let leftFrame = CGRectMake(0, 0, thickness, self.frame.size.height)
        let rightFrame = CGRectMake(self.frame.size.width-thickness, 0, thickness, self.frame.size.height)
        let topFrame = CGRectMake(0, 0, self.frame.size.width, thickness)
        
        // frame passed in
        
        if borderType == BorderType.top || borderType == BorderType.all {
            self.addBorderToView(withColor: color, frame: topFrame)
        }
        
        if borderType == BorderType.right || borderType == BorderType.all {
            self.addBorderToView(withColor: color, frame: rightFrame)
        }
        
        if borderType == BorderType.bottom || borderType == BorderType.all {
            self.addBorderToView(withColor: color, frame: bottomFrame)
        }
        
        if borderType == BorderType.left || borderType == BorderType.all {
            self.addBorderToView(withColor: color, frame: leftFrame)
        }
    }
    
    func addBorderToView(withColor color: UIColor, frame: CGRect) {
        //        view.layer.borderColor = color.CGColor
        //        view.layer.borderWidth = 1
        
        let border = CALayer()
        border.frame = frame
        border.backgroundColor = color.CGColor
        
        self.layer.addSublayer(border)
    }
    
    func setFont(view: UIView = UIView(), font: String = UIFont.AppFont.standard.rawValue) {
        let fontName = font
        
        if view.isKindOfClass(UILabel) {
            let label = view as! UILabel
            //            let fontDescription:UIFontDescriptor = label.font.fontDescriptor()
            //            var fontTraits = fontDescription.symbolicTraits
            // let isBold = nil != (label.font.fontDescriptor().symbolicTraits & UIFontDescriptorSymbolicTraits.TraitBold)
            
            //            fontName = standardFont
            let fontSize = label.font.pointSize
            label.font = UIFont(name: fontName, size: fontSize)
            //            label.textColor = AppColors.coreTextColorBase
        }
        
        if view.isKindOfClass(UITextField) {
            let textField = view as! UITextField
            textField.font = UIFont(name: fontName, size: textField.font!.pointSize)
            if textField.placeholder != nil {
                // textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSFontAttributeName : AppFonts.boldFont])
            }
        }
        
        if view.isKindOfClass(UIButton) {
            let button = view as! UIButton
            button.titleLabel!.font = UIFont(appFont: .bold, size: button.titleLabel!.font.pointSize)
        }
        
        for eachView in view.subviews {
            setFont(eachView)
        }
    }
    
}
