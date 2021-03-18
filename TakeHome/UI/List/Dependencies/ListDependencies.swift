//
//  ListDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

class ListDependencies: RootUIDependencies {

    func provideListView() -> UIViewController {
        let listViewController = ListViewController()
        listViewController.presenter = provideListPresenter(view: listViewController)

        return listViewController
    }

    private func provideListPresenter<T: UIViewController & ListView>(view: T) -> ListPresenter {
        return ListPresenter(view: view)
    }
}
