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

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        imageView.image = UIImage(systemName: "location.fill.viewfinder")
        imageView.tintColor = UIColor.primary
        titleLabel.text = NSLocalizedString("locationTitle", comment: "Header title")
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = UIColor.primary
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.textColor = UIColor.primary
    }
}
