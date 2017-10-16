//
//  CustomStoryboardSegue.swift
//  CustomTransition
//
//  Created by Sem0043 on 15/10/2017.
//  Copyright © 2017 Mahmut Pinarbasi. All rights reserved.
//

import UIKit

class CustomStoryboardSegue: UIStoryboardSegue {

    
    let transitioningDelegate = CustomTransitionDelegate()
    
    override func perform() {
        self.destination.transitioningDelegate = self.transitioningDelegate
        self.source.modalPresentationStyle = .custom
        self.source.present(self.destination, animated: true, completion: nil)
    }
}


class CustomStoryboardUnwindSegue: UIStoryboardUnwindSegueSource {
    
    
    
    
}
