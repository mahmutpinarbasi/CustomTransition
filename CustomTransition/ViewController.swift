//
//  ViewController.swift
//  CustomTransition
//
//  Created by Sem0043 on 15/10/2017.
//  Copyright © 2017 Mahmut Pinarbasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func presentAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showModal", sender: self)
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModalNavigationController"){
//            vc.transitioningDelegate = self
//            self.present(vc, animated: true, completion: nil)
//        }
        
    }
    
}

extension ViewController:UIViewControllerTransitioningDelegate {
    
    
    public func animationController(forPresented presented: UIViewController,
                                    presenting: UIViewController,
                                    source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return CustomTransitionAnimator()
    }
    
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return CustomTransitionAnimator()
    }
    
}

