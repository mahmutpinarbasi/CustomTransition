//
//  CustomTransitionDelegate.swift
//  CustomTransition
//
//  Created by Sem0043 on 15/10/2017.
//  Copyright © 2017 Mahmut Pinarbasi. All rights reserved.
//

import Foundation
import UIKit

class CustomTransitionDelegate: NSObject,UIViewControllerTransitioningDelegate {
    
    
    public func animationController(forPresented presented: UIViewController,
                                    presenting: UIViewController,
                                    source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return CustomTransitionAnimator()
    }
    
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return CustomTransitionAnimator()
    }

    
    
    
}
