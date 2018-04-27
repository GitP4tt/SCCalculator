//
//  SettingsController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 23.04.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    static var registerId = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
