//
//  AppDelegate.swift
//  toDoList
//
//  Created by Ali on 18/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil))
        vc.navigationBar.update(backgroundColor: .systemGreen , titleColor: .white, font: UIFont(name: "Helvetica-bold", size: 26)!)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}
