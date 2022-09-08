//
//  UIView_Extension.swift
//  UIViewUtilities
//
//  Created by Saumil on 08/09/22.
//

import Foundation
import UIKit

extension UIView {
    public func addCornerRadius(_ radius: CGFloat = 16) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
