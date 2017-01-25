//
//  HomeViewController.swift
//  FlowControllerDemo
//
//  Created by Jakub Vodak on 1/24/17.
//  Copyright © 2017 strv. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Action

    var newEventFlow: FlowViewController!
    
    @IBAction func newEventAction(_ sender: AnyObject) {
        
        newEventFlow = FlowViewController(navigationController!)
        
        newEventFlow.start()
        
        newEventFlow.didFinishBlock = { flowController in
            
            print("finish")
            
        }
    }
}
