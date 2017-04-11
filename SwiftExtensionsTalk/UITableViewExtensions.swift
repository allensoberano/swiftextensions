//
//  UITableView.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017 . All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    enum CustomCellIdentifiers: String {
        case peopleCell = "PeopleCell"
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

    var peopleCellIdentifier: String {
        get {
            return CustomCellIdentifiers.peopleCell.rawValue
        }
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

    
    /// Sets the default table style
    ///
    /// - parameter hideSeparator: if true the built in separator line is hidden
    func setDefaultStyle(_ hideSeparator: Bool = false) {
        self.tableFooterView = UIView(frame: CGRect.zero)
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        if hideSeparator == true {
            self.separatorStyle = .none
        }
        
        self.backgroundColor = UIColor.clear
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.clear
        
    }

    func createHeader(withText text: String, backgroundColor: UIColor = UIColor.appDefaultTableHeaderBackground) -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: headerHeight))
        containerView.backgroundColor = UIColor.white
        
        let headerView = UIView(frame: CGRect(x: 16, y: 10, width: self.frame.width - 32, height: 40))
        headerView.backgroundColor = backgroundColor
        containerView.addSubview(headerView)
        
        let headerLabel = createHeaderLabel(withText: text)
        headerView.addSubview(headerLabel)
        
        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .centerX, relatedBy: .equal, toItem: headerView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
        
        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .topMargin, relatedBy: .equal, toItem: headerView, attribute: .top, multiplier: 1, constant: 20)
        
        headerView.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
        
        return containerView
    }
    
    func createHeader(withText text: String, secondaryText: String, backgroundColor: UIColor = UIColor.appDefaultTableHeaderBackground) -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: doubleHeaderHeight))
        containerView.backgroundColor = UIColor.white
        
        let headerView = UIView(frame: CGRect(x: 16, y: 10, width: self.frame.width - 32, height: 60))
        headerView.backgroundColor = backgroundColor
        containerView.addSubview(headerView)
        
        let headerLabel = createHeaderLabel(withText: text)
        headerView.addSubview(headerLabel)
        
        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .centerX, relatedBy: .equal, toItem: headerView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
        
        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .topMargin, relatedBy: .equal, toItem: headerView, attribute: .top, multiplier: 1, constant: 20)
        
        headerView.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
        
        let secondaryLabel = createHeaderLabel(withText: secondaryText)
        headerView.addSubview(secondaryLabel)
        
        let secondaryLabelCenterVertical = NSLayoutConstraint(item: secondaryLabel, attribute: .centerX, relatedBy: .equal, toItem: headerLabel, attribute: .centerX, multiplier: 1, constant: 0)
        
        let secondaryLabelWidth = NSLayoutConstraint(item: secondaryLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: secondaryLabel.frame.size.width + 20)
        
        let secondaryLabelTop = NSLayoutConstraint(item: secondaryLabel, attribute: .topMargin, relatedBy: .equal, toItem: headerLabel, attribute: .top, multiplier: 1, constant: 30)
        
        headerView.addConstraints([secondaryLabelCenterVertical, secondaryLabelWidth, secondaryLabelTop])
        
        
        return containerView
    }
    
    func createFooter(withText text: String, backgroundColor: UIColor = UIColor.appCoreLightGray) -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: headerHeight))
        containerView.backgroundColor = UIColor.white
        
        let headerView = UIView(frame: CGRect(x: 16, y: 10, width: self.frame.width - 32, height: 40))
        headerView.backgroundColor = backgroundColor
        containerView.addSubview(headerView)
        
        let headerLabel = createHeaderLabel(withText: text)
        headerView.addSubview(headerLabel)
        
        let headerLabelCenterVertical = NSLayoutConstraint(item: headerLabel, attribute: .centerX, relatedBy: .equal, toItem: headerView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let hederLabelWidth = NSLayoutConstraint(item: headerLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: headerLabel.frame.size.width + 20)
        
        let headerLabelTop = NSLayoutConstraint(item: headerLabel, attribute: .topMargin, relatedBy: .equal, toItem: headerView, attribute: .top, multiplier: 1, constant: 20)
        
        headerView.addConstraints([headerLabelCenterVertical, hederLabelWidth, headerLabelTop])
        
        
        return containerView
    }
    
    fileprivate func createHeaderLabel(withText text: String) -> UILabel {
        let headerLabel = UILabel(frame: CGRect(x: 8, y: 8, width: self.frame.width, height: 21))
        headerLabel.text = text
        headerLabel.textAlignment = NSTextAlignment.center
        headerLabel.font = UIFont(appFont: .standard, size: 15)
        headerLabel.textColor = UIColor.white
        headerLabel.sizeToFit()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.backgroundColor = UIColor.clear
        
        return headerLabel
    }
    
    
    /// Registers a cell that has two labels side by side
    func registerItemValueCell() {
        let itemValueNib = UINib(nibName: "ItemValueCell", bundle: nil)
        self.register(itemValueNib, forCellReuseIdentifier: "ItemValueCell")
    }
    
    func registerInventoryProductCell() {
        let cellNib = UINib(nibName: "InventoryProductCell", bundle: nil)
        self.register(cellNib, forCellReuseIdentifier: "InventoryProductCell")
        
        self.rowHeight = 38
    }
    
    func registerA() {
        let productNib = UINib(nibName: "ProductCellWithQuantity", bundle: nil)
        self.register(productNib, forCellReuseIdentifier: "ProductCellWithQuantity")
    }
    
    func registerLocationInventoryCell() {
        let productNib = UINib(nibName: "LocationInventoryCell", bundle: nil)
        self.register(productNib, forCellReuseIdentifier: "LocationInventoryCell")
    }
    
}
