//
//  ItemCellView.swift
//  TakeHome
//
//  Created by Jmorgaz on 19/3/21.
//

import UIKit

class ItemCellView: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!

    func configure(_ title: String) {
        titleLabel.text = title
    }
}
