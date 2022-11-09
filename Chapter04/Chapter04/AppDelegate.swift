//
//  AppDelegate.swift
//  Chapter04
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("0 -- didFinishLaunchingWithOptions")
        
        let ud = UserDefaults.standard
        
        if ud.bool(forKey: UD_KEY_APP_FIRST_RUN){
            print("Already Runned")
        }else{
            print("App 1st Run")
            ud.set(true, forKey: UD_KEY_APP_FIRST_RUN)
        }
        
        print(NSHomeDirectory())
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("5 -- applicationWillTerminate")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

