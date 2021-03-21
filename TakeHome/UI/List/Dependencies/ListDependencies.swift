//
//  ListDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit
import MapKit

class ListDependencies: RootUIDependencies {

    func provideListView(pois: [MapPoi], location: CLLocationCoordinate2D?, delegate: MapViewDelegate?) -> UIViewController {
        let listViewController = ListViewController()
        listViewController.presenter = provideListPresenter(view: listViewController, pois: pois, location: location, delegate: delegate)

        return listViewController
    }

    private func provideListPresenter<T: UIViewController & ListView>(view: T,
                                                                      pois: [MapPoi],
                                                                      location: CLLocationCoordinate2D?,
                                                                      delegate: MapViewDelegate?) -> ListPresenter {
        return ListPresenter(view: view,
                             items: pois,
                             location: location,
                             delegate: delegate)
    }
}
