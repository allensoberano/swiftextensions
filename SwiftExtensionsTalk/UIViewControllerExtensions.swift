//
//  UIViewControllerExtensions.swift
//  WithMe-Mobile
//
//  Created by Justin Holman on 10/3/16.
//  Copyright © 2016 WithMe. All rights reserved.
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
 
    }
    
    var cameraPermission: AVAuthorizationStatus {
        return AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
    }
    
    func playBadSound() -> AVAudioPlayer? {
        let path = Bundle.mainBundle().pathForResource("banana.mp3", ofType: nil)
        let url = NSURL(fileURLWithPath: path!)
        
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            let sound = try AVAudioPlayer(contentsOfURL: url)
            
            sound.prepareToPlay()
            sound.play()
            return sound
        } catch {
            print("error")
        }
        
        return nil
    }
    
    /// Adds a cancel button to the upper left
    func addCancelButton(popController: Bool = false) {
        var cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(self.onCancelTap(_:)))
        
        if popController {
            cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(self.onCancelPopTap(_:)))
        }
        
        navigationItem.leftBarButtonItem = cancelButton
    }

    /// Sets the back button to just an <
    func setBackButtonStyle() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(appImage: .arrowLeft)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setNavigationTitle(title: String) {
        self.navigationItem.title = title.uppercased()
    }
    
    /// Sets the status bar to black
    func setStatusBarBlack() {
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            if statusBar.respondsToSelector(Selector("setBackgroundColor:")) {
                statusBar.backgroundColor = UIColor.blackColor()
            }
        }
    }

    func showMessage(withTitle title: String, message: String) {
        let messageView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
            
        }
        messageView.addAction(okAction)
        self.presentViewController(messageView, animated: true, completion: nil)
        
    }
    
    internal func onCancelTap(sender: UIBarButtonItem) {
        let confirmCancelView = UIAlertController(title: "Confirm Cancel", message: "Are you sure you want to cancel?", preferredStyle: .Alert)
        
        let noAction = UIAlertAction(title: "No", style: .Default, handler: nil)
        confirmCancelView.addAction(noAction)
        
        let yesAction = UIAlertAction(title: "Yes", style: .Default) { (action) in
            if self.presentingViewController != nil {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
        confirmCancelView.addAction(yesAction)
        
        self.presentViewController(confirmCancelView, animated: true, completion: nil)
    }
    
    internal func onCancelPopTap(sender: UIBarButtonItem) {
        hasChanged = true
        if hasChanged {
            let confirmCancelView = UIAlertController(title: "Confirm Cancel", message: "Are you sure you want to cancel?", preferredStyle: .Alert)
            
            let noAction = UIAlertAction(title: "No", style: .Default, handler: nil)
            confirmCancelView.addAction(noAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .Default) { (action) in
                self.navigationController?.popViewControllerAnimated(true)
            }
            confirmCancelView.addAction(yesAction)
            
            self.presentViewController(confirmCancelView, animated: true, completion: nil)
        } else {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }


}
