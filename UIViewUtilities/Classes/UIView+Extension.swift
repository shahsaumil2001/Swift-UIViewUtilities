//
//  UIView+Extension.swift
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
    
    public func borderColor(width: CGFloat, color: UIColor, clipToBounds: Bool = true) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = clipToBounds
    }
    
    public func roundedView(clipsToBounds: Bool = true) {
        self.clipsToBounds = clipsToBounds
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    public func setGradientBackground(topColor: UIColor = UIColor(red: 215/255.0, green: 226.0/255.0, blue: 251.0/255.0, alpha: 1.0), bottomColor: UIColor = UIColor(red: 87.0/255.0, green: 178.0/255.0, blue: 194.0/255.0, alpha: 1.0)) {
        let colorTop =  topColor.cgColor
        let colorBottom = bottomColor.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    public func blurrEffect() {
        self.clipsToBounds = true
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
    
    public func addShadow(shadowColor: UIColor = .black, shadowRadius: CGFloat = 10, shadowOffset: CGSize = .zero) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    public func shake(repeatCount: Float = 4, autoreverses: Bool = true) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.repeatCount = repeatCount
        animation.duration = 0.5/TimeInterval(animation.repeatCount)
        animation.autoreverses = autoreverses
        animation.values = [15, -15]
        layer.add(animation, forKey: "shake")
        
        let animation1 = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation1.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation1.repeatCount = repeatCount
        animation1.duration = 0.5/TimeInterval(animation.repeatCount)
        animation1.autoreverses = autoreverses
        animation1.values = [15, -15]
        layer.add(animation1, forKey: "shake")
    }
    
    public func topToBottomTransition() {
        // First Animation
        UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseInOut) {
            self.frame.size.width -= 20
            self.frame.size.height -= 20
            self.frame.origin.x += 10
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
                self.frame.origin.y += 40
            }
        }
        
        // Second Animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
                self.frame.origin.y -= 40
            } completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                    self.frame.size.width += 20
                    self.frame.size.height += 20
                    self.frame.origin.x -= 10
                }
            }
        }
    }
    
    public func flipAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform.identity.rotated(by: .pi )
        } completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform.identity.rotated(by: .pi * 2)
            }
        }
    }
}
