//
//  BaseView.swift
//  TakeHome
//
//  Created by Jmorgaz on 21/3/21.
//

import UIKit

// sourcery: AutoMockable
protocol BaseView: class {
    var presenter: Presenter? { get }
    func showTitle(_ title: String)
    func showInfoView(message: String)
    func removeInfoView()
}
