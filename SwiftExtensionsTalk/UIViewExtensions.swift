//
//  UIView+Appearance.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
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

    func addDropShadow(_ radius: CGFloat = 2) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 0.5
    }
    
    /**
     Allows view to partialy show the elements behind it
     
     - parameter baseColor: - color to use as the base (default is background color)
     - parameter transparencyValue: - (default is 0.8)
     */
    func addTransparency(_ baseColor: UIColor = UIColor.appBackgroundLight, transparencyValue: CGFloat = 0.8) {
        self.backgroundColor = baseColor.withAlphaComponent(transparencyValue)
    }

    func drawLine(start: CGPoint, toPoint end: CGPoint, ofColor lineColor: UIColor) -> CAShapeLayer {
        
        // design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        // design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
        return shapeLayer
    }
    
    func addBorder(_ color: UIColor, thickness: CGFloat, borderType: BorderType) {
        let bottomFrame = CGRect(x: 0, y: self.frame.size.height-thickness, width: self.frame.size.width, height: thickness)
        let leftFrame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.size.height)
        let rightFrame = CGRect(x: self.frame.size.width-thickness, y: 0, width: thickness, height: self.frame.size.height)
        let topFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: thickness)
        
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
        border.backgroundColor = color.cgColor
        
        self.layer.addSublayer(border)
    }
    
    func setFont(_ view: UIView = UIView(), font: String = UIFont.AppFont.standard.rawValue) {
        let fontName = font
        
        if view.isKind(of: UILabel.self) {
            let label = view as! UILabel
            //            let fontDescription:UIFontDescriptor = label.font.fontDescriptor()
            //            var fontTraits = fontDescription.symbolicTraits
            // let isBold = nil != (label.font.fontDescriptor().symbolicTraits & UIFontDescriptorSymbolicTraits.TraitBold)
            
            //            fontName = standardFont
            let fontSize = label.font.pointSize
            label.font = UIFont(name: fontName, size: fontSize)
            //            label.textColor = AppColors.coreTextColorBase
        }
        
        if view.isKind(of: UITextField.self) {
            let textField = view as! UITextField
            textField.font = UIFont(name: fontName, size: textField.font!.pointSize)
            if textField.placeholder != nil {
                // textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSFontAttributeName : AppFonts.boldFont])
            }
        }
        
        if view.isKind(of: UIButton.self) {
            let button = view as! UIButton
            button.titleLabel!.font = UIFont(appFont: .bold, size: button.titleLabel!.font.pointSize)
        }
        
        for eachView in view.subviews {
            setFont(eachView)
        }
    }
    
}
