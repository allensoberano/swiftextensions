//
//  UIColor+Appearance.swift
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public class var appBackgroundLight: UIColor {
        return appConcrete
    }
    
    public class var appBackgroundDark: UIColor {
        return appThunder
    }
    
    public class var appCoreBlue: UIColor {
       return UIColor(red: 87/255, green: 175/255, blue: 246/255, alpha: 1.00)
    }
    
    public class var appCoreSecondaryBlue: UIColor {
        return self.appBahamaBlue
    }
    
    public class var appCoreGreen: UIColor {
        return UIColor(red: 0.37, green: 0.76, blue: 0.65, alpha: 1.00)
    }
    
    public class var appCoreLightBlue: UIColor {
        return UIColor(red: 0.00, green: 0.73, blue: 0.81, alpha: 1.00)
    }
    
    public class var appCoreOrange: UIColor {
        return UIColor(red: 1.00, green: 0.48, blue: 0.47, alpha: 1.00)
    }
    public class var appCorePurple: UIColor {
        return UIColor(red: 0.21, green: 0.35, blue: 0.69, alpha: 1.00)
    }
    
    public class var appCoreDarkBlue: UIColor {
        return UIColor(red: 0.16, green: 0.36, blue: 0.51, alpha: 1.00)
    }
    
    public class var appCoreLightGray: UIColor {
        return UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.00)
    }
    
    public class var appBlack: UIColor {
        return UIColor(red: 0.15, green: 0.19, blue: 0.21, alpha: 1.00)
    }
    public class var appCoreBlack: UIColor {
        return UIColor(red: 0.15, green: 0.19, blue: 0.21, alpha: 1.00)
    }
    
    public class var appBlue: UIColor {
        return UIColor(red: 87/255, green: 175/255, blue: 246/255, alpha: 1)
    }
    
    public class var appBorderImage: UIColor {
        return UIColor(red: 0.91, green: 0.91, blue: 0.93, alpha: 1.00)
    }
    public class var appBorderRowSeparator: UIColor {
        return UIColor(red: 0.63, green: 0.64, blue: 0.67, alpha: 1.00)
    }
    
    public class var appButtonDefault: UIColor {
        return UIColor(red: 0.00, green: 0.60, blue: 0.93, alpha: 1.00)
    }
    
    public class var appTextMain: UIColor {
        return UIColor(red: 0.24, green: 0.25, blue: 0.25, alpha: 1.00)
    }
    
    public class var appTextSecondary: UIColor {
        return UIColor(red: 0.63, green: 0.64, blue: 0.67, alpha: 1.00)
    }
    
    public class var appBarButton: UIColor {
        return UIColor(red: 0.47, green: 0.47, blue: 0.49, alpha: 1.00)
    }
    
    public class var appSideMenuBackground: UIColor {
        return UIColor(red: 0.19, green: 0.25, blue: 0.28, alpha: 1.00)
    }
    
    public class var appPageIndicatorColor: UIColor {
        return UIColor(red: 0.68, green: 0.70, blue: 0.71, alpha: 1.00)
    }
    
    // Associate
    public class var appAssociateOpen: UIColor {
        return UIColor(red: 0.94, green: 0.54, blue: 0.47, alpha: 1.00)
    }
    
    public class var appAssociateInProgress: UIColor {
        return UIColor(red: 0.49, green: 0.72, blue: 0.66, alpha: 1.00)
    }
    
    public class var appAssociateCompleted: UIColor {
        return UIColor(red: 0.68, green: 0.70, blue: 0.71, alpha: 1.00)
    }
    
    public class var appCoreDisabled: UIColor {
        return appCoreLightGray //   UIColor(red: 0.39, green: 0.43, blue: 0.45, alpha: 1.00)
    }
    
    public class var appDefaultTableHeaderBackground: UIColor {
        return appThunder
    }
    
    /// Default header color for tables
    public class var appThunder: UIColor {
        return UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
    }
    
    public class var appCoreWhite: UIColor {
        return UIColor()
    }
    
    public class var appCharcoal: UIColor {
        return UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1.00)
    }
    
    public class var appConcrete: UIColor {
        return UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    }
    
    public class var appBahamaBlue: UIColor {
        return UIColor(red: 0.16, green: 0.36, blue: 0.51, alpha: 1.00)
    }
}
