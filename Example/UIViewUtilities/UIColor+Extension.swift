//
//  UIColor+Extension.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 13/12/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var extraaLightBlue: UIColor {
        let color = 0xC9E6FD
        return UIColor.rgb(fromHex: color)
    }
    
    class var lightBlue: UIColor {
        let color = 0xC9E6FD
        return UIColor.rgb(fromHex: color)
    }

    class var lightGradient: UIColor {
        let color = 0xD7E2FB
        return UIColor.rgb(fromHex: color)
    }
    
    class var darkGradient: UIColor {
        let color = 0x57B2C2
        return UIColor.rgb(fromHex: color)
    }
    
    class var header: UIColor {
        let color = 0xEBF1FA
        return UIColor.rgb(fromHex: color)
    }
    
    class func rgb(fromHex: Int) -> UIColor {

        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
