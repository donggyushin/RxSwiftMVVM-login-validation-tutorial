//
//  Coordinator.swift
//  rxmvvmloginvalidation
//
//  Created by 신동규 on 2021/01/10.
//

import UIKit

class Coordinator {
    let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
    }
}
