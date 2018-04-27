//
//  OverviewController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 23.04.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import UIKit

class OverviewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.hideKeyboardWhenTappedAround()

    }


}
