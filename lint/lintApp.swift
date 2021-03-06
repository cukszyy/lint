//
//  lintApp.swift
//  lint
//
//  Created by Lucas Portella on 14/09/20.
//

import SwiftUI
import Firebase

@main
struct lintApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    Auth.auth().canHandle(url)
                })
        }
    }
}
