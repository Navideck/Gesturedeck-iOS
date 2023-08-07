//
//  AppDelegate.swift
//  Gesturedeck example
//
//  Created by Fotios Dimanidis on 18.09.22.
//

import UIKit
import GesturedeckiOS

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var gesturedeck: Gesturedeck?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        return true
    }
  
    /// Only for demonstration purposes. Use this when no SceneDelegate is present. Not called in this example app as SceneDelegate is used instead
    func applicationDidBecomeActive(_ application: UIApplication) {
        gesturedeck = gesturedeck ?? Gesturedeck()
        gesturedeck?.tapAction = {
            print("tapped")
        }

        gesturedeck?.swipeLeftAction = {
            print("swiped Left")
        }

        gesturedeck?.swipeRightAction = {
            print("swiped Right")
        }
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

