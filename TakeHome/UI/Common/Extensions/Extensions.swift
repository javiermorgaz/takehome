//
//  Extensions.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

extension UIView {
    public func constraintEdgesToSuperview(insets: UIEdgeInsets = .zero, translateConstraints: Bool) {
        guard let superview = superview else {
            assertionFailure("The view \(self) doesn't have a superview")
            return
        }

        translatesAutoresizingMaskIntoConstraints = translateConstraints

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right),
        ])
    }
}

extension UIColor {
    static let primary = UIColor(named: "primary")
    static let interaction = UIColor(named: "interaction")
    static let background = UIColor(named: "background")
    static let backgroundAlternative = UIColor(named: "backgroundAlternative")
    static let onBackground = UIColor(named: "onBackground")
}
