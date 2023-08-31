//
//  ViewEffectCell.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 16/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class ViewEffectCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    fileprivate func setup() {
        // Set Color
        self.initColor()
        // Set Font
        self.initFont()
    }
    
    fileprivate func initColor() {
        self.tintColor = .darkGradient
    }
    
    fileprivate func initFont() {
        self.titleLabel.font = UIFont.systemFont(ofSize: UIDevice.current.model  == StringConstants.iPad ? 18 : 17)
    }
    
    func setData(effect: Effect) {
        self.titleLabel.text = effect.name
    }
}
