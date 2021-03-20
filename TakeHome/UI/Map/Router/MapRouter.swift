//
//  MapRouter.swift
//  TakeHome
//
//  Created by Jmorgaz on 19/3/21.
//

import UIKit

protocol MapRoutable {
    func showList(_ items: [PoiItem], delegate: MapViewDelegate)
    func dismiss()
}

class MapRouter: MapRoutable {

    private weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func showList(_ items: [PoiItem], delegate: MapViewDelegate) {

        guard let rootViewController = rootViewController else { return }

        let viewController = UINavigationController(rootViewController: UIDependencies.shared.list.provideListView(pois: items, delegate: delegate))
        rootViewController.present(viewController, animated: true, completion: nil)
    }

    func dismiss() {

        guard let rootViewController = rootViewController else { return }
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
