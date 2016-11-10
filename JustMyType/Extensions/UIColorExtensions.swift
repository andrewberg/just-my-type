//
//  UIColorExtensions.swift
//  JustMyType
//
//  Created by Lauren Koulias on 9/24/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

extension UIColor {
    // Get selected seasons color
    static func seasonColorOne() -> UIColor {
        let defaults = UserDefaults.standard;
        let selectedSeason = defaults.integer(forKey: "COLOR_SETTING");
        
        switch selectedSeason {
        case 0:
            return UIColor.appColorSpring1();
        case 1:
            return UIColor.appColorSummer1();
        case 2:
            return UIColor.appColorFall1();
        case 3:
            return UIColor.appColorWinter1();
        default:
            return UIColor.appColorSpring1();
        }
    }
    
    static func seasonColorTwo() -> UIColor {
        let defaults = UserDefaults.standard;
        let selectedSeason = defaults.integer(forKey: "COLOR_SETTING");
        
        switch selectedSeason {
        case 0:
            return UIColor.appColorSpring2();
        case 1:
            return UIColor.appColorSummer2();
        case 2:
            return UIColor.appColorFall2();
        case 3:
            return UIColor.appColorWinter2();
        default:
            return UIColor.appColorSpring2();
        }
    }
    
    static func seasonColorThree() -> UIColor {
        let defaults = UserDefaults.standard;
        let selectedSeason = defaults.integer(forKey: "COLOR_SETTING");
        
        switch selectedSeason {
        case 0:
            return UIColor.appColorSpring3();
        case 1:
            return UIColor.appColorSummer3();
        case 2:
            return UIColor.appColorFall3();
        case 3:
            return UIColor.appColorWinter3();
        default:
            return UIColor.appColorSpring3();
        }
    }
    
    static func seasonColorFour() -> UIColor {
        let defaults = UserDefaults.standard;
        let selectedSeason = defaults.integer(forKey: "COLOR_SETTING");
        
        switch selectedSeason {
        case 0:
            return UIColor.appColorSpring4();
        case 1:
            return UIColor.appColorSummer4();
        case 2:
            return UIColor.appColorFall4();
        case 3:
            return UIColor.appColorWinter4();
        default:
            return UIColor.appColorSpring4();
        }
    }
    
    static func themeChosen() -> UIColor {
        let defaults = UserDefaults.standard;
        let selectedTheme = defaults.integer(forKey: "THEME_SETTING");
        
        switch selectedTheme {
        case 0:
            return UIColor.white;
        case 1:
            return UIColor.black;
        default:
            return UIColor.white;
        }
    }
    
    //spring
    static func appColorSpring1() -> UIColor {
        return UIColor(red:0.44, green:0.49, blue:0.97, alpha:1.0); //Blue
    }
    
    static func appColorSpring2() -> UIColor {
        return UIColor(red:0.43, green:0.96, blue:0.51, alpha:1.0); //Green
    }
    
    static func appColorSpring3() -> UIColor {
        return UIColor(red:0.44, green:0.77, blue:0.97, alpha:1.0); //Light Blue
    }

    static func appColorSpring4() -> UIColor {
        return UIColor(red:0.75, green:0.44, blue:0.97, alpha:1.0); //Purple
    }
    
    //summer
    //fa582b, faf191, c2ea9b, 17a992
    static func appColorSummer1() -> UIColor {
        return UIColor(red:0.98, green:0.35, blue:0.17, alpha:1.0); //Red
    }
    
    static func appColorSummer2() -> UIColor {
        return UIColor(red:0.98, green:0.95, blue:0.57, alpha:1.0); //Yellow
    }
    
    static func appColorSummer3() -> UIColor {
        return UIColor(red:0.76, green:0.92, blue:0.61, alpha:1.0); //Light Green
    }
    
    static func appColorSummer4() -> UIColor {
        return UIColor(red:0.09, green:0.66, blue:0.57, alpha:1.0); //Teal
    }
    
    //fall
    //4A572C, CF5230, F59A44, 6E352C
    static func appColorFall1() -> UIColor {
        return UIColor(red:0.81, green:0.32, blue:0.18, alpha:1.0); //Red
    }
    
    static func appColorFall2() -> UIColor {
        return UIColor(red:0.29, green:0.34, blue:0.17, alpha:1.0); //Dark Green
    }
    
    static func appColorFall3() -> UIColor {
        return UIColor(red:0.96, green:0.54, blue:0.27, alpha:1.0); //Orange
    }
    
    static func appColorFall4() -> UIColor {
        return UIColor(red:0.43, green:0.21, blue:0.17, alpha:1.0); //Brown
    }
    
    //winter
    //bdf2ed, 8f91bf, 80b4bf, 033e8c
    static func appColorWinter1() -> UIColor {
        return UIColor(red:0.74, green:0.95, blue:0.93, alpha:1.0); //Light Blue
    }
    
    static func appColorWinter2() -> UIColor {
        return UIColor(red:0.56, green:0.57, blue:0.75, alpha:1.0); //Light Purple
    }
    
    static func appColorWinter3() -> UIColor {
        return UIColor(red:0.50, green:0.71, blue:0.75, alpha:1.0); //Blue
    }
    
    static func appColorWinter4() -> UIColor {
        return UIColor(red:0.01, green:0.24, blue:0.55, alpha:1.0); //Dark Blue
    }
}
