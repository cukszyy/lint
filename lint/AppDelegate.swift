//
//  AppDelegate.swift
//  lint
//
//  Created by Lucas Portella on 14/09/20.
//

import Foundation
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
      }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // TODO: implement notifications
        return
    }
    
}
