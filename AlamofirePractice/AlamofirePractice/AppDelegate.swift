//
//  AppDelegate.swift
//  AlamofirePractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupRootViewController()
        
        return true
    }

    private func setupRootViewController () {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
    }

}

