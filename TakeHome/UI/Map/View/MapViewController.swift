//
//  MapViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

protocol MapView: BaseView {

}

final class MapViewController: BaseViewController, MapView {

    var presenter: MapPresenter!
}
