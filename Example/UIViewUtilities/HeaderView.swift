//
//  HeaderView.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 14/12/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    // MARK: - Outlets

    @IBOutlet var mainView: UIView!
    @IBOutlet var effectView: UIView!

    // MARK: - Properties

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
