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
    
    
    // MARK: - Action
    
    func start()
    {
        showLocationScreen()
    }
    
    func showLocationScreen()
    {
        let storyboard = UIStoryboard(name: "Location", bundle: nil)
        
        if let controller = storyboard.instantiateInitialViewController() as? LocationViewController {
            
            controller.delegate = self
            
            navigationController.pushViewController(controller, animated: true)
        }
    }
    
    func showDateScreen()
    {
        let storyboard = UIStoryboard(name: "Date", bundle: nil)
        
        if let controller = storyboard.instantiateInitialViewController() as? DateViewController {
            
            controller.delegate = self
            
            navigationController.pushViewController(controller, animated: true)
        }
    }
    
    func showSummaryScreen()
    {
        let storyboard = UIStoryboard(name: "Summary", bundle: nil)
        
        if let controller = storyboard.instantiateInitialViewController() as? SummaryViewController {
            
            controller.delegate = self
            
            controller.newEvent = newEvent
            
            navigationController.pushViewController(controller, animated: true)
        }
    }
    
    func finish()
    {
        navigationController.popToRootViewController(animated: true)
        
        didFinishBlock!(self)
    }
}

extension FlowViewController: LocationViewControllerDelegate {
    
    func controllerDidFinishWithLocation(location: String, controller: LocationViewController) {
        
        newEvent.location = location
        
        showDateScreen()
    }
    
    func controllerDidCancel(controller: LocationViewController) {
        
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
