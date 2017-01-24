//
//  UIImage.swift
//  Bankjoy
//
//  Created by Jakub Vodak on 11/18/16.
//  Copyright © 2016 strv. All rights reserved.
//

import UIKit

extension UIImage {
    
    //Returns image with specified size of certain color.
    class func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width:1, height: 1)) -> UIImage {
        
        let rect = CGRect(x: 0.0, y:  0.0, width:  size.width, height:  size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
}
