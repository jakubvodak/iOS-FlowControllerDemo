//
//  LocationViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import UIKit

protocol LocationViewControllerDelegate: class {
    
    func controllerDidFinishWithLocation(location: String, controller: LocationViewController)
    
    func controllerDidCancel(controller: LocationViewController)
}

class LocationViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var txtLocation: UITextField!
    
    
    // MARK: - Delegate
    
    weak var delegate: LocationViewControllerDelegate?
    
    fileprivate func didFinishWithLocation(location: String) {
        
        delegate?.controllerDidFinishWithLocation(location: location, controller: self)
    }
    
    fileprivate func didCancel() {
        
        delegate?.controllerDidCancel(controller: self)
    }
    
    
    // MARK: - Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyAppearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtLocation.becomeFirstResponder()
    }
    
    
    func applyAppearance() {
        
        /* General */
        
        title = "New Event"
        
        
        /* Buttons */
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(LocationViewController.nextAction))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    
    // MARK: - Action
    
    func nextAction() {
        
        txtLocation.resignFirstResponder()
        
        didFinishWithLocation(location: txtLocation.text!)
    }
}
