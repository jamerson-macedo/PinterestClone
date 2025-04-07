//
//  Utilities.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 07/04/25.
//

import Foundation
import UIKit

final class Utilities {
    static let shared = Utilities()
    private init(){
        
    }
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabBarController = controller as? UITabBarController {
            if let selected = tabBarController.selectedViewController {
                return topViewController(controller: selected)
            }
          
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
        
    }
    
}
