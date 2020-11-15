//
//  AppRouter.swift
//  JewellaryMenu
//
//  Created by Bunny Bhargav on 15/11/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    private var window: UIWindow
    init(_ window: UIWindow) {
        self.window = window
    }
    func initiateNavigation()
    {
    let vc = JewallaryMenu()
    let nav = UINavigationController(rootViewController: vc)
    window.rootViewController = nav
    window.makeKeyAndVisible()
    }
}
