//
//  MapDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

class MapDependencies: RootUIDependencies {

    func provideMapView() -> UIViewController {
        let mapViewController = MapViewController()
        mapViewController.presenter = provideMapPresenter(view: mapViewController)

        return mapViewController
    }

    private func provideMapPresenter<T: UIViewController & MapView>(view: T) -> MapViewPresenter {
        let router = MapRouter(rootViewController: view)
        return MapPresenter(view: view,
                            getPoisUseCase: root.core.pois.provideGetPoisUseCase(),
                            router: router)
    }
}
