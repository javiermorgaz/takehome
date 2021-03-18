//
//  BaseView.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

protocol BaseView: class {
    func showTitle(_ title: String)
    func showInfoView(message: String)
    func removeInfoView()
}
