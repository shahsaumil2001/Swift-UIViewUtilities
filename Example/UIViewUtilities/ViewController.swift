//
//  ViewController.swift
//  UIViewUtilities
//
//

import UIKit
import UIViewUtilities

class ViewController: UIViewController {
    
    // MARK: - Outlets -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    var effectVM = EffectViewModel()
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Function -
    fileprivate func setup() {
        self.setupTableView()
        navigationController?.navigationBar.barTintColor = UIColor(red: 246/255, green: 248/255, blue: 250/255, alpha: 1.0)
    }
    
    fileprivate func setupTableView() {
        // Register nib
        let ViewEffectNib = UINib(nibName: ViewEffectCell.staticIdentifier, bundle: nil)
        self.tableView.register(ViewEffectNib, forCellReuseIdentifier: ViewEffectCell.staticIdentifier)
        
        // Register header
        let headerNib = UINib(nibName: HeaderView.staticIdentifier, bundle: nil)
        self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: HeaderView.staticIdentifier)

        // Set dataSource and delegate
        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Hide separator
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        
        if #available(iOS 15.0, *) {
            // Remove extraa top passing from tableview section
            self.tableView.sectionHeaderTopPadding = 0.0
        } else {
            // Fallback on earlier versions
        }
    }
}

