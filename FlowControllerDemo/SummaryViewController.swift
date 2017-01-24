//
//  SummaryViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import UIKit

protocol SummaryViewControllerDelegate: class {
    
    func controllerDidConfirm(controller: SummaryViewController)
    
    func controllerDidCancel(controller: SummaryViewController)
}

class SummaryViewController: UIViewController {

    // MARK: - Delegate
    
    weak var delegate: SummaryViewControllerDelegate?
    
    fileprivate func didConfirm() {
        
        delegate?.controllerDidConfirm(controller: self)
    }
    
    fileprivate func didCancel() {
        
        delegate?.controllerDidCancel(controller: self)
    }
    
    
    // MARK: - Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
