//
//  AppDelegate.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 19/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureNavBar()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
   
    }
    func configureNavBar() {
        let themeColor = UIColor(red: 0.43, green: 0.33, blue: 0.6, alpha: 1)
        self.window?.tintColor = themeColor
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = themeColor   
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().clipsToBounds = false
        UINavigationBar.appearance().shadowImage = UIImage()
        
        if let customFont = UIFont(name: "AvenirNextCondensed-Regular", size: 15.5){
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : customFont, NSAttributedStringKey.foregroundColor: themeColor]
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: customFont], for: .normal)
        } else {
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15.5, weight: .light), NSAttributedStringKey.foregroundColor: UIColor.black]
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15.5, weight: .light)], for: .normal)
        }
    }

}

