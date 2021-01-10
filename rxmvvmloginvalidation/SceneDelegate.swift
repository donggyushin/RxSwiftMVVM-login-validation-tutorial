//
//  SceneDelegate.swift
//  rxmvvmloginvalidation
//
//  Created by 신동규 on 2021/01/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let coordinator = Coordinator(window: window!)
        coordinator.start()
    }


}

