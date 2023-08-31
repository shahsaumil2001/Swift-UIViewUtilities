//
//  ViewController+TableView+Delegates.swift
//  UIViewUtilities_Example
//
//  Created by Saumil Shah on 16/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.effectVM.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(self.effectVM.numberOfRows(section: section))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.effectVM.rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.effectVM.headerHeight(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /*
         let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.effectVM.screenWidth, height: self.effectVM.headerHeight(section: section)))
         headerView.backgroundColor = self.effectVM.headerColor
         
         let effectView = UIView.init(frame: CGRect.init(x: 20, y: 20, width: tableView.frame.width - 40, height: self.effectVM.headerHeight(section: section) - 40))
         effectView.backgroundColor = .extraaLightBlue
         headerView.addSubview(effectView)
         self.effectVM.applyEffectToHeader(view: effectView, effect: self.effectVM.selectedEffect)
         return headerView
         */
        
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.staticIdentifier) as? HeaderView {
            self.effectVM.applyEffectToHeader(view: headerView.effectView, effect: self.effectVM.selectedEffect)
            return headerView
        }
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewEffectCell.staticIdentifier, for: indexPath) as? ViewEffectCell else {
            return ViewEffectCell()
        }
        let effect = self.effectVM.getEffect(section: indexPath.section, indexPath: indexPath)
        cell.setData(effect: effect)
        cell.accessoryType = effect.isSelected ?? false ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let headerView = self.tableView.headerView(forSection: indexPath.section) as? HeaderView else { return }
        self.effectVM.clearAllEffect(view: headerView.effectView)
        // Select Effect
        self.effectVM.selectEffect(section: indexPath.section, indexPath: indexPath)
        self.tableView.reloadData()
    }
}
