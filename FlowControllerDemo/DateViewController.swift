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

    // MARK: - Outlets 
    
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
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

        applyAppearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtDate.becomeFirstResponder()
    }
    

    func applyAppearance() {
        
        /* General */
        
        title = "New Event"
        
        
        /* Buttons */
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(DateViewController.nextAction))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        
        /* Date Picker */
        
        datePicker.backgroundColor = UIColor.black
        
        datePicker.setValue(UIColor.white, forKey: "textColor")
        
        txtDate.inputView = datePicker
    }
    
    
    // MARK: - Action
    
    @IBAction func updateDate(_ sender: AnyObject)
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        txtDate.text = dateFormatter.string(from: datePicker.date)
    }
    
    
    func nextAction() {
        
        txtDate.resignFirstResponder()
        
        didFinishWithText(date: datePicker.date)
    }
}
