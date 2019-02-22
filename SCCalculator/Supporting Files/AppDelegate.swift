//
//  AppDelegate.swift
//  SCCalculator
//
//  Created by Patrice Bender on 16.03.18.
//  Copyright © 2018 Patrice Bender. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if(SettingsController.cashierName == ""){
            presentOnboardingDialog()
        }else{
            print(SettingsController.cashierName + "is back!")
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func presentOnboardingDialog() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Gebe deinen Namen und den heutigen Gegner an!", message: "Enter a text", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Name"
        })
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Gegner"
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Speichern", style: .default, handler: { [weak alert] (action) -> Void in
            let name = alert?.textFields![0].text!
            let opponent = alert?.textFields![1].text!
            
            if (name!.isEmpty) {
                self.presentOnboardingDialog()
            } else {
                SettingsController.cashierName = name!
                SettingsController.opponent = opponent!
            }
        
        }))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)

        // 4. Present the alert.
    }


}

