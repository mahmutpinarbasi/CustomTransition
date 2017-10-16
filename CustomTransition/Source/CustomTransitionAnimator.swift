//
//  CustomTransitionAnimator.swift
//  CustomTransition
//
//  Created by Sem0043 on 15/10/2017.
//  Copyright © 2017 Mahmut Pinarbasi. All rights reserved.
//

import UIKit

class CustomTransitionAnimator: NSObject {
    

    //MARK: - Private
    private func animatePresentation(using transitionContext: UIViewControllerContextTransitioning){
        
        let destination = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let source = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let transitionDuration = self.transitionDuration(using: transitionContext)
        let container = transitionContext.containerView
        
        destination.view.frame = container.bounds;
        source.view.frame = container.bounds;
        
        // Add destination view to container
        container.addSubview(destination.view)
        
        // Move destination view below source view
        destination.view.frame = self.presentingControllerFrame(with: transitionContext)
        
        
        source.beginAppearanceTransition(false, animated: true)
    
        UIView.animateKeyframes(withDuration: transitionDuration,
                                delay: 0.0,
                                options: UIViewKeyframeAnimationOptions.calculationModeCubic,
                                animations: {
                                    destination.view.frame = container.bounds
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.8,
                                                       animations: {

                                                        var persfectiveTransform = source.view.layer.transform
                                                        persfectiveTransform.m34 = 1.0 / -1000.0
                                                        persfectiveTransform = CATransform3DTranslate(persfectiveTransform, 0, 0, -100)
                                                        source.view.layer.transform = persfectiveTransform
                                                        
                                                        
                                    })
                                
                                    
        }, completion: {(completed) in
            
            // End appearance transition for destination controller
            source.endAppearanceTransition()
            
            // Finish transition
            transitionContext.completeTransition(true)
        })
    }
    
    private func animateDismissal(using transitionContext: UIViewControllerContextTransitioning){
        
        let destination = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let source = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let transitionDuration = self.transitionDuration(using: transitionContext)
        let container = transitionContext.containerView
        
        destination.view.frame = container.bounds;
        source.view.frame = container.bounds;
        
        // Place container view before source view
        container.superview?.sendSubview(toBack: container)
        
        // Add destination view to container
        container.addSubview(destination.view)

        
        // Move destination snapshot back in Z plane
        // Important: original transform3d is different from CATransform3DIdentity
        let originalTransform = source.view.layer.transform;

        
        destination.beginAppearanceTransition(true, animated: true)
        
        // Apply custom transform
        var perspectiveTransform = originalTransform
        perspectiveTransform.m34 = 1.0 / -1000.0
        perspectiveTransform = CATransform3DTranslate(perspectiveTransform, 0, 0, -100)
        destination.view.layer.transform = perspectiveTransform
        
        
        UIView.animateKeyframes(withDuration: transitionDuration,
                                delay: 0.0,
                                options: UIViewKeyframeAnimationOptions.calculationModeCubic,
                                animations: {
                                    source.view.frame = self.presentingControllerFrame(with: transitionContext)
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.8,
                                                       animations: {
                                                        destination.view.layer.transform = originalTransform
                                    })
        }) { (completed) in
            
            destination.endAppearanceTransition()
            
            transitionContext.completeTransition(true)
            
        }
    }
    
    private func presentingControllerFrame(with context:UIViewControllerContextTransitioning) -> CGRect {
        let frame = context.containerView.bounds
        return CGRect.init(x: 0, y: frame.height, width: frame.width, height: frame.height)
    }

    
    
}// end of CustomTransitionAnimator






extension CustomTransitionAnimator : UIViewControllerAnimatedTransitioning{
    
    //MARK: - UIViewControllerAnimatedTransitioning
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        
        return 0.5
        
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        if let destination = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to){
            if destination.isBeingPresented {
                self.animatePresentation(using: transitionContext)
            }else{
                self.animateDismissal(using: transitionContext)
            }
        }
    }
    
    
}












