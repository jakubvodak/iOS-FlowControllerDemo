//
//  DateViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import UIKit

protocol DateViewControllerDelegate: class {
    
    func controllerDidFinishWithDate(date: Date, controller: DateViewController)
    
    func controllerDidCancel(controller: DateViewController)
}

class DateViewController: UIViewController {

    // MARK: - Delegate
    
    weak var delegate: DateViewControllerDelegate?
    
    fileprivate func didFinishWithText(date: Date) {
        
        delegate?.controllerDidFinishWithDate(date: date, controller: self)
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
