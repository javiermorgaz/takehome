//
//  ListDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

class ListDependencies: RootUIDependencies {

    func provideListView(pois: [PoiItem], delegate: MapViewDelegate?) -> UIViewController {
        let listViewController = ListViewController()
        listViewController.presenter = provideListPresenter(view: listViewController, pois: pois, delegate: delegate)

        return listViewController
    }

    private func provideListPresenter<T: UIViewController & ListView>(view: T,
                                                                      pois: [PoiItem],
                                                                      delegate: MapViewDelegate?) -> ListPresenter {
        return ListPresenter(view: view,
                             items: pois,
                             delegate: delegate)
    }
}
