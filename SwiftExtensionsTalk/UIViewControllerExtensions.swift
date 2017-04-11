//
//  UIViewControllerExtensions.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

private var hasChangedValue: Bool = false

extension UIViewController {
    
    var hasChanged: Bool {
        get {
            return hasChangedValue
        }
        set(value) {
            hasChangedValue = value
        }
    }
    
    struct Platform {
        static let isSimulator: Bool = {
            var isSim = false
            #if arch(i386) || arch(x86_64)
                isSim = true
            #endif
            return isSim
        }()
    }
    
    enum EnvironmentType {
        case dev
        case qa
        case production
    }
    
    var Environment: EnvironmentType {
        #if DEVAPI
            return .dev
        #elseif QAAPI
            return .qa
        #elseif PRODAPI
            return .production
        #endif

        return .dev
 
    }
    
    var cameraPermission: AVAuthorizationStatus {
        return AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
    }
    
    
    
    /// Adds a cancel button to the upper left
    func addCancelButton(_ popController: Bool = false) {
        var cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.onCancelTap(_:)))
        
        if popController {
            cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.onCancelPopTap(_:)))
        }
        
        navigationItem.leftBarButtonItem = cancelButton
    }

    /// Sets the back button to just an <
    func setBackButtonStyle() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(appImage: .arrowLeft)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }


    /// Sets the title of the navigation bar
    ///
    /// - Parameter title: Title to set
    func setNavigationTitle(_ title: String) {
        self.navigationItem.title = title.properCased()
    }
    
    /// Sets the status bar to black
    func setStatusBarBlack() {
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            if statusBar.responds(to: Selector("setBackgroundColor:")) {
                statusBar.backgroundColor = UIColor.black
            }
        }
    }

    func showMessage(withTitle title: String, message: String) {
        let messageView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
        }
        messageView.addAction(okAction)
        self.present(messageView, animated: true, completion: nil)
        
    }
    
    internal func onCancelTap(_ sender: UIBarButtonItem) {
        let confirmCancelView = UIAlertController(title: "Confirm Cancel", message: "Are you sure you want to cancel?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        confirmCancelView.addAction(noAction)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            if self.presentingViewController != nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        confirmCancelView.addAction(yesAction)
        
        self.present(confirmCancelView, animated: true, completion: nil)
    }
    
    internal func onCancelPopTap(_ sender: UIBarButtonItem) {
        hasChanged = true
        if hasChanged {
            let confirmCancelView = UIAlertController(title: "Confirm Cancel", message: "Are you sure you want to cancel?", preferredStyle: .alert)
            
            let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
            confirmCancelView.addAction(noAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            confirmCancelView.addAction(yesAction)
            
            self.present(confirmCancelView, animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }


}
