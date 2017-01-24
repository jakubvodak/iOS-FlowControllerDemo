//
//  TextViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import UIKit

protocol TextViewControllerDelegate: class {
    
    func controllerDidFinishWithText(text: String, controller: TextViewController)
    
    func controllerDidCancel(controller: TextViewController)
}

class TextViewController: UIViewController {

    // MARK: - Delegate
    
    weak var delegate: TextViewControllerDelegate?
    
    fileprivate func didFinishWithText(text: String) {
        
        delegate?.controllerDidFinishWithText(text: text, controller: self)
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
