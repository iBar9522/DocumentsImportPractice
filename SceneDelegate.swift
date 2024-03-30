//
//  SceneDelegate.swift
//  DocumentsImportPractice
//
//  Created by Aibar Abylgazin on 29.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navVC = UINavigationController(rootViewController: ViewController())
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
    }
}

