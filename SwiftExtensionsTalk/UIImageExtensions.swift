//
//  UIImageExtensions.swift
//  SwiftExtensionsTalk
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    enum AppImages: String {
        case a = "a"
        case arrowLeft = "ArrowLeft"
    }

    convenience init!(appImage: AppImages) {
        self.init(named: appImage.rawValue)
    }
}
