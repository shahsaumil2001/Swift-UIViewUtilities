//
//  EffectViewModel.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 16/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class EffectViewModel {
    
    // MARK: - Properties
    
    var screenWidth = UIScreen.main.bounds.width
    var effects: [Effect] = Effect.all()
    var rowHeight: CGFloat {
        return 60.0
    }
    var headerColor: UIColor {
        return UIColor.header
    }
    var selectedEffect = EffectType.none
    
    // MARK: - Functions
    
    ///
    /// The func is `headerHeight`  returns height for header
    ///  A EffectViewModel's `headerHeight` method
    ///
    func headerHeight(section: Int) -> CGFloat {
        return section == TableSections.properties.rawValue ? 200.0 : 0.0
    }
    
    ///
    /// The func is `numberOfSection` returns section count
    ///  A EffectViewModel's `numberOfSection` method
    ///
    func numberOfSection() -> Int {
        return 1
    }
    
    ///
    /// The func is `numberOfRows` returns rows count of section
    ///  A EffectViewModel's `numberOfRows` method
    ///
    func numberOfRows(section: Int) -> Int {
        return self.effects.count
    }
    
    ///
    /// The func is `getEffect` returns effect for indexPath
    ///  A EffectViewModel's `getEffect` method
    ///
    func getEffect(section: Int, indexPath: IndexPath) -> Effect {
        return self.effects[indexPath.row]
    }
    
    ///
    /// The func is `applyEffectToHeader` used to apply effect on header
    ///  A EffectViewModel's `applyEffectToHeader` method
    ///
    func applyEffectToHeader(view: UIView, effect: EffectType) {
        switch effect {
        case .borderColor:
            view.borderColor(width: 3, color: .darkGradient)
        case .roundView:
            view.roundedView(clipsToBounds: true)
        case .roundCorners:
            view.roundCorners(corners: [.topLeft, .bottomRight], radius: 50)
        case .gradientBackground:
            view.setGradientBackground(topColor: .lightGradient, bottomColor: .darkGradient)
        case .blurBackground:
            // Add image to show blur effect
            let imageView = UIImageView()
            imageView.image = .image
            imageView.frame = view.bounds
            view.addSubview(imageView)
            view.blurrEffect()
        case .shadow:
            view.addShadow()
        case .shakeAnimation:
            view.shake()
        case .topToBottomAnimation:
            view.topToBottomTransition()
        case .flipAnimation:
            view.flipAnimation()
        case .none:
            self.clearAllEffect(view: view)
        }
    }
    
    ///
    /// The func is `clearAllEffect` will remove all effects
    ///  A EffectViewModel's `clearAllEffect` method
    ///
    func clearAllEffect(view: UIView) {
        // Change background
        view.backgroundColor = .lightBlue
        // Remove border
        view.borderColor(width: 0, color: .clear)
        // Remove rounded view
        view.layer.cornerRadius = 0
        view.clipsToBounds = false
        // Remove round Corners
        view.layer.mask = nil
        // Remove gradient background
        view.layer.sublayers = view.layer.sublayers?.filter { theLayer in
              !theLayer.isKind(of: CAGradientLayer.classForCoder())
        }
        // Remove blur background
        for subview in view.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
            // Remove image which was added to show blur effect
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
        // Remove shadow
        view.layer.shadowOpacity = 0.0;
    }
    
    ///
    /// The func is `selectEffect` used to select effect for row
    ///  A EffectViewModel's `selectEffect` method
    ///
    func selectEffect(section: Int, indexPath: IndexPath) {
        // Deselect all other effects
        self.deselectOtherEffects()
        var effect = self.getEffect(section: section, indexPath: indexPath)
        // Set selected effect
        self.selectedEffect = effect.effect ?? .none
        // Select current effect
        effect.isSelected = true
        self.effects[indexPath.row] = effect
    }
    
    ///
    /// The func is `deselectOtherEffects` used to deselect all rows
    ///  A EffectViewModel's `deselectOtherEffects` method
    ///
    func deselectOtherEffects() {
        self.effects = Effect.all()
    }
}
