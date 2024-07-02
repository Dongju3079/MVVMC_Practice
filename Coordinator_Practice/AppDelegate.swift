//
//  AppDelegate.swift
//  Coordinator_Practice
//
//  Created by CatSlave on 7/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.appCoordinator.start()
        return true
    }
}

