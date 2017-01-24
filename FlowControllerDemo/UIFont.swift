//
//  UIFont.swift
//  Bankjoy
//
//  Created by Jakub Vodak on 11/21/16.
//  Copyright © 2016 strv. All rights reserved.
//

import UIKit

enum FontWeight: Int {
    case light
    case regular
    case medium
    case bold
    case demibold
}

extension UIFont {
    
    class func applicationFont(_ weight: FontWeight, size: CGFloat) -> UIFont {
        switch weight {
            
        case .demibold:
            return UIFont.applicationDemibold(size)
            
        case .bold:
            return UIFont.applicationBold(size)
            
        case .medium:
            return UIFont.applicationMedium(size)
        
        case .light:
            return UIFont.applicationLight(size)
            
        default:
            return UIFont.applicationRegular(size)
        }
    }
    
    
    class func applicationDemibold(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "AvenirNext-DemiBold", size: size)!
    }
    
    class func applicationBold(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "AvenirNext-Bold", size: size)!
    }
    
    class func applicationMedium(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "AvenirNext-Medium", size: size)!
    }
    
    class func applicationLight(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "AvenirNext-UltraLight", size: size)!
    }
    
    class func applicationRegular(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "AvenirNext-Regular", size: size)!
    }
}
