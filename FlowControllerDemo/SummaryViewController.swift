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

    // MARK: - Data
    
    var newEvent: Event!
    
    
    // MARK: - Outlets 
    
    @IBOutlet weak var lblLocationValue: UILabel!
    
    @IBOutlet weak var lblDateValue: UILabel!
    
    
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

        applyAppearance()
        
        configureView()
    }

    func applyAppearance() {
        
        /* General */
        
        title = "New Event"
        
        
        /* Buttons */
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SummaryViewController.doneAction))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func configureView() {
        
        lblLocationValue.text = newEvent.location
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        lblDateValue.text = dateFormatter.string(from: newEvent.date!)
    }
    
    
    // MARK: - Action
    
    func doneAction() {
        
        didConfirm()
    }
}
