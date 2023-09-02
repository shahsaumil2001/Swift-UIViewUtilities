# UIViewUtilities

[![CI Status](https://img.shields.io/travis/shahsaumil20011991@gmail.com/UIViewUtilities.svg?style=flat)](https://travis-ci.org/shahsaumil20011991@gmail.com/UIViewUtilities)
[![Version](https://img.shields.io/cocoapods/v/UIViewUtilities.svg?style=flat)](https://cocoapods.org/pods/UIViewUtilities)
[![License](https://img.shields.io/cocoapods/l/UIViewUtilities.svg?style=flat)](https://cocoapods.org/pods/UIViewUtilities)
[![Platform](https://img.shields.io/cocoapods/p/UIViewUtilities.svg?style=flat)](https://cocoapods.org/pods/UIViewUtilities)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

UIViewUtilities is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UIViewUtilities'
```
## features
### 1. CornerRadius on UIView
    extension UIView {
        public func addCornerRadius(_ radius: CGFloat = 16) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
    }

### 2. BorderColor on UIView
     extension UIView {
         public func borderColor(width: CGFloat, color: UIColor, clipToBounds: Bool = true) {
            self.layer.borderWidth = width
            self.layer.borderColor = color.cgColor
            self.clipsToBounds = clipToBounds
         }
     }

### 3. RoundRect All Sides on UIView
     extension UIView {    
         public func roundedView(clipsToBounds: Bool = true) {
            self.clipsToBounds = clipsToBounds
            self.layer.cornerRadius = self.frame.height / 2
        }
     }

 ### 4. RoundRect Specific Sides on UIView
     extension UIView { 
        public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
     }
    
 ### 5. Gradient on UIView
      extension UIView { 
        public func setGradientBackground(topColor: UIColor = UIColor(red: 215/255.0, green: 226.0/255.0, blue: 251.0/255.0, alpha: 1.0), bottomColor: UIColor             = UIColor(red: 87.0/255.0, green: 178.0/255.0, blue: 194.0/255.0, alpha: 1.0)) {
            let colorTop =  topColor.cgColor
            let colorBottom = bottomColor.cgColor
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at:0)
        }
    }
    
 ### 6. Blur on UIView
     extension UIView { 
        public func blurEffect() {
            self.clipsToBounds = true
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(blurEffectView)
        }
    }
    
 ### 7. Shadow on UIView
      extension UIView { 
        public func addShadow(shadowColor: UIColor = .black, shadowRadius: CGFloat = 10, shadowOffset: CGSize = .zero) {
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    }

 ### 8. Shake animation on UIView
      extension UIView { 
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
     }
    
 ### 9. Flip animation on UIView
      extension UIView { 
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

https://github.com/shahsaumil2001/Swift-UIViewUtilities/assets/56787966/7abf82b6-b84a-4817-93f5-663fe1a3dc8a

## License

UIViewUtilities is available under the MIT license. See the LICENSE file for more info.
