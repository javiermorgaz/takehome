//
//  ItemCellView.swift
//  TakeHome
//
//  Created by Jmorgaz on 19/3/21.
//

import UIKit

class ItemCellView: UITableViewCell {

    @IBOutlet private weak var vehicleLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var vehicleImageView: UIImageView!
    @IBOutlet private weak var statusImageView: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    
    private enum Keys {
        static let vehicleLabelFontSize: CGFloat = 18
        static let idLabelFontSize: CGFloat = 16
        static let selectedColorAlpha: CGFloat = 0.5
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func configure(id: String, vehicle: PoiType, status: State) {

        idLabel.text = id
        vehicleLabel.text = vehicle.rawValue

        switch status {
        case .active:
            statusImageView.image = UIImage(systemName: "checkmark.circle")
            statusImageView.tintColor = UIColor.primary
        case .inactive:
            statusImageView.image = UIImage(systemName: "xmark.circle")
            statusImageView.tintColor = UIColor.secondary
        }
    }

    private func setupView() {

        separatorView.backgroundColor = UIColor.primary
        vehicleImageView.image = UIImage(systemName: "car")
        vehicleImageView.tintColor = UIColor.primary
        vehicleLabel.font = .systemFont(ofSize: Keys.vehicleLabelFontSize, weight: .bold)
        vehicleLabel.textColor = UIColor.onBackground
        idLabel.font = .systemFont(ofSize: Keys.idLabelFontSize, weight: .regular)
        idLabel.textColor = UIColor.onBackground
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.primary?.withAlphaComponent(Keys.selectedColorAlpha)
        selectedBackgroundView = backgroundView
    }}
