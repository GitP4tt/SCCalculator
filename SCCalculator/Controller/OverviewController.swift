//
//  OverviewController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 23.04.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import UIKit

class OverviewController: UIViewController {
    
    //General information for Matchday
    @IBOutlet weak var revenueTextField: UITextField!
    @IBOutlet weak var cashierTextField: UITextField!
    @IBOutlet weak var opponentTextField: UITextField!
    @IBOutlet weak var bestsellerTextField: UITextField!
    @IBOutlet weak var averageOrderTextField: UITextField!
    @IBOutlet weak var maxOrderTextField: UITextField!
    
    
    //Product count
    @IBOutlet weak var beerCount: UITextField!
    @IBOutlet weak var roteCount: UITextField!
    @IBOutlet weak var sauerCount: UITextField!
    @IBOutlet weak var radlerCount: UITextField!
    @IBOutlet weak var brezelCount: UITextField!
    @IBOutlet weak var merquezCount: UITextField!
    @IBOutlet weak var kaeseCount: UITextField!
    @IBOutlet weak var mezzoCount: UITextField!
    @IBOutlet weak var waterCount: UITextField!
    @IBOutlet weak var apfelCount: UITextField!
    @IBOutlet weak var spriteCount: UITextField!
    @IBOutlet weak var fantaCount: UITextField!
    @IBOutlet weak var colaCount: UITextField!
    @IBOutlet weak var teaCount: UITextField!
    @IBOutlet weak var coffeeCount: UITextField!
    @IBOutlet weak var schorleCount: UITextField!
    @IBOutlet weak var weinCount: UITextField!
    @IBOutlet weak var pfandCount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.hideKeyboardWhenTappedAround()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewFromMatchday()
    }
    
    
    private func updateViewFromMatchday() {
        fillProductCountFields()
        
        fillMatchInfoView()
        
    }

    
    fileprivate func fillProductCountFields() {
        beerCount.text = String(Product.productCount["Bier"]!)
        roteCount.text = String(Product.productCount["Rote"]!)
        sauerCount.text = String(Product.productCount["Sauer"]!)
        radlerCount.text = String(Product.productCount["Radler"]!)
        brezelCount.text = String(Product.productCount["🥨"]!)
        merquezCount.text = String(Product.productCount["Merquez"]!)
        kaeseCount.text = String(Product.productCount["Kaese"]!)
        mezzoCount.text = String(Product.productCount["Mezzo"]!)
        waterCount.text = String(Product.productCount["Wasser"]!)
        apfelCount.text = String(Product.productCount["Apfel"]!)
        spriteCount.text = String(Product.productCount["Sprite"]!)
        fantaCount.text = String(Product.productCount["Fanta"]!)
        colaCount.text = String(Product.productCount["Cola"]!)
        teaCount.text = String(Product.productCount["Tee"]!)
        coffeeCount.text = String(Product.productCount["Kaffee"]!)
        schorleCount.text = String(Product.productCount["Schorle"]!)
        weinCount.text = String(Product.productCount["Wein"]!)
        
    }
    
    fileprivate func fillMatchInfoView() {
        revenueTextField.text = String(ModelController.matchday.revenue) + " €"
        cashierTextField.text = String(SettingsController.cashierName)
        opponentTextField.text = SettingsController.opponent
        bestsellerTextField.text = ModelController.matchday.bestSeller.key + " x" + String(ModelController.matchday.bestSeller.value)
        averageOrderTextField.text = String(ModelController.matchday.averageOrderValue!) + " €"
        maxOrderTextField.text = String(ModelController.matchday.maxOrderValue!) + " €"
        pfandCount.text = String(Product.productCount["🥤"]!) + " €"
    }

}
