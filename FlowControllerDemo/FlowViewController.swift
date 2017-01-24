//
//  FlowViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import Foundation

class FlowViewController {
    
    // MARK: - Properties
    
    var newEvent: Event
    
    var didFinishBlock: ((FlowViewController) -> Void)?
    
    
    // MARK: - Object Lifecycle
    
    required init()
    {
        newEvent = Event()
    }
    
    deinit
    {
        
    }
    
    
    // MARK: - Action
    
    func startFlow()
    {
        
    }
}
