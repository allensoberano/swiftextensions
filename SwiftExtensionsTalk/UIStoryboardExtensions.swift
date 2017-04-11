//
//  UIStoryboardExtensions.swift
//  SwiftExtensionsTalk
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum AppStoryboards: String {
        case login = "Login"
        case home = "Home"
        case people = "People"
    }

    convenience init(appStoryboard: AppStoryboards) {
        self.init(name: appStoryboard.rawValue, bundle: nil)
    }
}
