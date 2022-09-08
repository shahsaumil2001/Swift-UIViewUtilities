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

    public func addBorderLine(width: CGFloat = 1, color: UIColor = UIColor.black.withAlphaComponent(0.1)) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    public func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
