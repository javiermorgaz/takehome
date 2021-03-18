//
//  ListViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

protocol ListView: BaseView {

}

class ListViewController: BaseViewController, ListView {

    var presenter: ListPresenter!
}
