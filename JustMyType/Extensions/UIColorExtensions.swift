//
//  UIColorExtensions.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

extension UIColor {
    static func appColorGreen() -> UIColor {
        //return UIColor(hue: 0.5, saturation: 1, brightness: 0.9, alpha: 1.0);
        return UIColor(red:0.43, green:0.96, blue:0.51, alpha:1.0);
    }
    
    static func appColorTeal() -> UIColor {
        return UIColor(red:0.44, green:0.97, blue:0.84, alpha:1.0);
    }
    
    static func appColorLightBlue() -> UIColor {
        //return UIColor(hue: 0.4333, saturation: 1, brightness: 0.72, alpha: 1.0);
        return UIColor(red:0.44, green:0.77, blue:0.97, alpha:1.0);
    }
    
    static func appColorBlue() -> UIColor {
        return UIColor(red:0.44, green:0.49, blue:0.97, alpha:1.0);
    }
    
    static func appColorPurple() -> UIColor {
        return UIColor(red:0.75, green:0.44, blue:0.97, alpha:1.0);
    }
}
