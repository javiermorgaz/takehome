//
//  BaseViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

class BaseViewController: UIViewController, BaseView {

    var presenter: Presenter? {
        return nil
    }

    var infoViewMessage: String?

    private enum Keys {
        static let labelWidth: CGFloat = 200
        static let labelHeight: CGFloat = 20
        static let labelXPosition: CGFloat = 0
        static let labelYPosition: CGFloat = 0
        static let numberOfLines: Int = 0
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private lazy var infoView: UIView? = {

        guard let infoViewMessage = infoViewMessage else { return nil }
        let infoView = UIView()
        let label = UILabel(frame: CGRect(x: Keys.labelXPosition, y: Keys.labelYPosition, width: Keys.labelWidth, height: Keys.labelHeight))
        label.textAlignment = .center
        label.text = infoViewMessage
        label.numberOfLines = Keys.numberOfLines
        label.backgroundColor = UIColor.background
        infoView.addSubview(label)
        label.constraintEdgesToSuperview(translateConstraints: false)

        return infoView
    }()

    func showTitle(_ title: String) {
        navigationItem.title = title
    }

    func showInfoView(message: String) {

        self.infoViewMessage = message
        if let infoView = infoView, !view.subviews.contains(infoView) {
            view.addSubview(infoView)
            infoView.constraintEdgesToSuperview(translateConstraints: false)
        }
    }

    func removeInfoView() {
        infoView?.removeFromSuperview()
    }
}
