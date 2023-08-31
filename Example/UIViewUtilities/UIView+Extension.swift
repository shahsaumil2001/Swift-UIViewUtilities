//
//  UIView+Extension.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 16/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {
    static var staticIdentifier: String {
        return String(describing: self)
    }
}
