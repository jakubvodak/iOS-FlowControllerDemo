//
//  FlowViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import UIKit

class FlowViewController {
    
    // MARK: - Properties
    
    var newEvent: Event
    
    var navigationController: UINavigationController!
    
    var didFinishBlock: ((FlowViewController) -> Void)?
    
    
    // MARK: - Object Lifecycle
    
    required init(_ navigationController: UINavigationController)
    {
        self.navigationController = navigationController
        
        self.newEvent = Event()
    }
    
    deinit
    {
        
    }
    
    
    // MARK: - Action
    
    func start()
    {
        showLocationScreen()
    }
    
    func showLocationScreen()
    {
        
    }
    
    func showDateScreen()
    {
        
    }
    
    func showSummaryScreen()
    {
        
    }
    
    func finish()
    {
        didFinishBlock!(self)
    }
}

extension FlowViewController: TextViewControllerDelegate {
    
    func controllerDidFinishWithText(text: String, controller: TextViewController) {
        
        newEvent.name = text
        
        showDateScreen()
    }
    
    func controllerDidCancel(controller: TextViewController) {
        
    }
}

extension FlowViewController: DateViewControllerDelegate {
    
    func controllerDidFinishWithDate(date: Date, controller: DateViewController) {
        
        newEvent.date = date
        
        showSummaryScreen()
    }
    
    func controllerDidCancel(controller: DateViewController) {
        
    }
}

extension FlowViewController: SummaryViewControllerDelegate {
    
    func controllerDidConfirm(controller: SummaryViewController) {
        
        finish()
    }
    
    func controllerDidCancel(controller: SummaryViewController) {
        
    }
}
