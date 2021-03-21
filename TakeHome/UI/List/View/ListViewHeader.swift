//
//  ListViewHeader.swift
//  TakeHome
//
//  Created by Jmorgaz on 20/3/21.
//

import UIKit

class ListViewHeader: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {

        separatorView.backgroundColor = UIColor.primary
        imageView.image = UIImage(systemName: "location.fill.viewfinder")
        imageView.tintColor = UIColor.primary
        titleLabel.text = NSLocalizedString("locationTitle", comment: "Header title")
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
}
