//
//  Effect.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 16/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

///  A struct's `UBSideMenu` property used as  'Model'
///
struct Effect {
    var name: String?
    var effect: EffectType?
    var isSelected: Bool?
}

extension Effect {
    ///
    /// The func is `all` returns
    ///  An Effect extension's `all` method
    ///
    static func all() -> [Effect] {
            return [
                Effect(name: "Border with color", effect: EffectType.borderColor, isSelected: false),
                Effect(name: "Complete round", effect: EffectType.roundView, isSelected: false),
                Effect(name: "Round corners", effect: EffectType.roundCorners, isSelected: false),
                Effect(name: "Gradient background", effect: EffectType.gradientBackground, isSelected: false),
                Effect(name: "Blur background", effect: EffectType.blurBackground, isSelected: false),
                Effect(name: "Shadow", effect: EffectType.shadow, isSelected: false),
                Effect(name: "Shake animation", effect: EffectType.shakeAnimation, isSelected: false),
                Effect(name: "Top to bottom animation", effect: EffectType.topToBottomAnimation, isSelected: false),
                Effect(name: "Flip animation", effect: EffectType.flipAnimation, isSelected: false),
                Effect(name: "None", effect: EffectType.none)
            ]
    }
}
