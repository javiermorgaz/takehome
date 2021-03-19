//
//  MapRouter.swift
//  TakeHome
//
//  Created by Jmorgaz on 19/3/21.
//

import UIKit

protocol MapRoutable {
    func showList()
}

class MapRouter: MapRoutable {

    private weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func showList() {
        guard let rootViewController = rootViewController else { return }

        let viewController = UIDependencies.shared.list.provideListView() // UIKit
        rootViewController.present(viewController, animated: true, completion: nil)
    }
}
