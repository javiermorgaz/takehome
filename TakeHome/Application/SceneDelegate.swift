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

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.primary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.onPrimary!]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.onPrimary!]

        UINavigationBar.appearance().tintColor = UIColor.onPrimary
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
