//
//  UITableView+Appearance.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 8/9/16.
//  Copyright © 2016 WithMe. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    enum CustomCellIdentifiers: String {
        case itemValue = "ItemValueCell"
        case product = "ProductCellWithQuantity"
    }
    
    var headerHeight: CGFloat {
        return 50
    }
    
    var doubleHeaderHeight: CGFloat {
        return 80
    }

    var heightInventoryProductCell: CGFloat {
        return 75
    }
    
    var heightLocationInventoryCell: CGFloat {
        return 38
    }
    
    
    var itemValueCellIdentifier: String {
        get {
            return "ItemValueCell"
        }
    }
    
    var productCellIdentifier: String {
        get {
            return "ProductCellWithQuantity"
        }
    }
    
    var inventoryProductCellIndentifier: String {
        get {
            return "InventoryProductCell"
        }
    }
    
    var locationInventoryCellIdentifier: String {
        get {
            return "LocationInventoryCell"
        }
    }
    
    func createBackgroundView(withText message: String) {
        self.backgroundView = nil
        
        let containerView = UIView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        containerView.backgroundColor = UIColor.clear
        
        let messageLabel = UILabel(frame: CGRectMake(0, 0, self.frame.size.width, 75))
        messageLabel.text = message
        
        let messageLabelHeight: CGFloat = 75
        
        messageLabel.sizeToFit()
        messageLabel.textAlignment = .center
        messageLabel.backgroundColor = UIColor.clear
        messageLabel.textColor = UIColor.appTextSecondary
                
        messageLabel.font = UIFont(appFont: .standard, size: 15)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(messageLabel)
        
        let messageLeft = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: .Equal, toItem: containerView, attribute: .Leading, multiplier: 1.0, constant: 16)
        
        let messageRight = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -16)
        
        let messageHeight = NSLayoutConstraint(item: messageLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: messageLabelHeight)
        
        
        containerView.addConstraints([messageLeft, messageRight, messageHeight])
        
        
        let imageView = UIImageView() // frame: CGRectMake(0, 0, 100, 100)
        imageView.frame.size.height = 100
        imageView.frame.size.width = 100
        
        imageView.tintColor = UIColor.appAssociateOpen
        
        imageView.contentMode = .ScaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(appImage: .barcode)
        containerView.addSubview(imageView)
        
        let imageHeight = NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 130)
        
        let imageWidth = NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        
        let imageCenter = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let imageCenterVertical = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: containerView, attribute: .CenterY, multiplier: 1, constant: 0)
        
        containerView.addConstraints([imageHeight, imageWidth, imageCenter, imageCenterVertical])
        
        let messageBottom = NSLayoutConstraint(item: messageLabel, attribute: .BottomMargin, relatedBy: .Equal, toItem: imageView, attribute: .Top, multiplier: 1, constant: -25)
        
        containerView.addConstraint(messageBottom)
        
        self.backgroundView = containerView
    }
    
    /// Sets the default table style
    ///
    /// - parameter hideSeparator: if true the built in separator line is hidden
    func setDefaultStyle(hideSeparator hideSeparator: Bool = false) {
        self.tableFooterView = UIView(frame: CGRectZero)
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        if hideSeparator == true {
            self.separatorStyle = .none
        }
        
        self.backgroundColor = UIColor.clear
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.clear
        
    }
    
    
//    func createHeader(withText text: String, width: CGFloat) -> UIView {
//        let headerview = UIView(frame: CGRectMake(0, 0, width, 40))
//        
//        headerview.drawLine(start: CGPointMake(16, 20), toPoint: CGPointMake(headerview.frame.size.width - 16, 20), ofColor: UIColor.appTextSecondary)
//        
//        let headerLabel = UILabel(frame: CGRectMake(8, 8, width, 21))
//        headerLabel.text = text
//        headerLabel.textAlignment = NSTextAlignment.Center
//        headerLabel.font = UIFont(appFont: .standard, size: 15)
//        headerLabel.textColor = UIColor.appTextSecondary
//        headerLabel.sizeToFit()
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerLabel.backgroundColor = UIColor.appBackgroundLight
//        
//        headerview.addSubview(headerLabel)
//        headerview.backgroundColor = UIColor.appBackgroundLight
//        
//        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .CenterX, relatedBy: .Equal, toItem: headerview, attribute: .CenterX, multiplier: 1, constant: 0)
//        
//        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
//        
//        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .TopMargin, relatedBy: .Equal, toItem: headerview, attribute: .Top, multiplier: 1, constant: 16)
//        
//        headerview.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
//        
//        return headerview
//    }
    
    func createHeader(withText text: String, backgroundColor: UIColor = UIColor.appDefaultTableHeaderBackground) -> UIView {
        let containerView = UIView(frame: CGRectMake(0, 0, self.frame.width, headerHeight))
        containerView.backgroundColor = UIColor.whiteColor()
        
        let headerView = UIView(frame: CGRectMake(16, 10, self.frame.width - 32, 40))
        headerView.backgroundColor = backgroundColor
        containerView.addSubview(headerView)
        
        let headerLabel = createHeaderLabel(withText: text)
        headerView.addSubview(headerLabel)
        
        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .CenterX, relatedBy: .Equal, toItem: headerView, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
        
        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .TopMargin, relatedBy: .Equal, toItem: headerView, attribute: .Top, multiplier: 1, constant: 20)
        
        headerView.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
        
        return containerView
    }
    
    func createHeader(withText text: String, secondaryText: String, backgroundColor: UIColor = UIColor.appDefaultTableHeaderBackground) -> UIView {
        let containerView = UIView(frame: CGRectMake(0, 0, self.frame.width, doubleHeaderHeight))
        containerView.backgroundColor = UIColor.whiteColor()
        
        let headerView = UIView(frame: CGRectMake(16, 10, self.frame.width - 32, 60))
        headerView.backgroundColor = backgroundColor
        containerView.addSubview(headerView)
        
        let headerLabel = createHeaderLabel(withText: text)
        headerView.addSubview(headerLabel)
        
        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .CenterX, relatedBy: .Equal, toItem: headerView, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
        
        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .TopMargin, relatedBy: .Equal, toItem: headerView, attribute: .Top, multiplier: 1, constant: 20)
        
        headerView.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
        
        let secondaryLabel = createHeaderLabel(withText: secondaryText)
        headerView.addSubview(secondaryLabel)
        
        let secondaryLabelCenterVertical = NSLayoutConstraint(item: secondaryLabel, attribute: .CenterX, relatedBy: .Equal, toItem: headerLabel, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let secondaryLabelWidth = NSLayoutConstraint(item: secondaryLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: secondaryLabel.frame.size.width + 20)
        
        let secondaryLabelTop = NSLayoutConstraint(item: secondaryLabel, attribute: .TopMargin, relatedBy: .Equal, toItem: headerLabel, attribute: .Top, multiplier: 1, constant: 30)
        
        headerView.addConstraints([secondaryLabelCenterVertical, secondaryLabelWidth, secondaryLabelTop])
        
        
        return containerView
    }
    
    func createFooter(withText text: String, backgroundColor: UIColor = UIColor.appCoreLightGray) -> UIView {
        let containerView = UIView(frame: CGRectMake(0, 0, self.frame.width, headerHeight))
        containerView.backgroundColor = UIColor.whiteColor()
        
        let headerView = UIView(frame: CGRectMake(16, 10, self.frame.width - 32, 40))
        headerView.backgroundColor = backgroundColor
        containerView.addSubview(headerView)
        
        let headerLabel = createHeaderLabel(withText: text)
        headerView.addSubview(headerLabel)
        
        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .CenterX, relatedBy: .Equal, toItem: headerView, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
        
        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .TopMargin, relatedBy: .Equal, toItem: headerView, attribute: .Top, multiplier: 1, constant: 20)
        
        headerView.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
        
        
        return containerView
    }
    
    private func createHeaderLabel(withText text: String) -> UILabel {
        let headerLabel = UILabel(frame: CGRectMake(8, 8, self.frame.width, 21))
        headerLabel.text = text
        headerLabel.textAlignment = NSTextAlignment.Center
        headerLabel.font = UIFont(appFont: .standard, size: 15)
        headerLabel.textColor = UIColor.whiteColor()
        headerLabel.sizeToFit()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.backgroundColor = UIColor.clearColor()
        
        return headerLabel
    }
    
    
    /// Registers a cell that has two labels side by side
    func registerItemValueCell() {
        let itemValueNib = UINib(nibName: "ItemValueCell", bundle: nil)
        self.registerNib(itemValueNib, forCellReuseIdentifier: "ItemValueCell")
    }
    
    func registerInventoryProductCell() {
        let cellNib = UINib(nibName: "InventoryProductCell", bundle: nil)
        self.registerNib(cellNib, forCellReuseIdentifier: "InventoryProductCell")
        
        self.rowHeight = 38
    }
    
    func registerA() {
        let productNib = UINib(nibName: "ProductCellWithQuantity", bundle: nil)
        self.registerNib(productNib, forCellReuseIdentifier: "ProductCellWithQuantity")
    }
    
    func registerLocationInventoryCell() {
        let productNib = UINib(nibName: "LocationInventoryCell", bundle: nil)
        self.registerNib(productNib, forCellReuseIdentifier: "LocationInventoryCell")
    }
    
}
