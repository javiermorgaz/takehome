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

    private enum Keys {
        static let titleLabelFontSize: CGFloat = 16
        static let subtitleLabelFontSize: CGFloat = 16
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {

        separatorView.backgroundColor = UIColor.primary
        imageView.image = UIImage(systemName: "location.fill.viewfinder")
        imageView.tintColor = UIColor.primary
        titleLabel.text = NSLocalizedString("locationTitle", comment: "Header title")
        titleLabel.font = .systemFont(ofSize: Keys.titleLabelFontSize, weight: .regular)
        subtitleLabel.font = .systemFont(ofSize: Keys.subtitleLabelFontSize, weight: .bold)
    }
}
