//
//  SceneDelegate.swift
//  TakeHome
//
//  Created by Jmorgaz on 17/3/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: UIDependencies.shared.map.provideMapView())
        self.window = window
        setupNavigationBarApparence()
        window.makeKeyAndVisible()
    }

    private func setupNavigationBarApparence() {
        UINavigationBar.appearance().barTintColor = UIColor.primary
        UINavigationBar.appearance().tintColor = UIColor.onPrimary
    }
}
