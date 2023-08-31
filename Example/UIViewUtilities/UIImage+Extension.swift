//
//  UIImage+Extension.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 13/12/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

extension UIImage {

    class var image: UIImage {
        return self.image(fromString: "image")
    }

    class func image(fromString: String) -> UIImage {
        return UIImage(named: fromString) ?? UIImage()
    }
}
