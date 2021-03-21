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

        vehicleImageView.image = UIImage(systemName: "car")
        vehicleImageView.tintColor = UIColor.primary
        vehicleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        vehicleLabel.textColor = UIColor.onBackground
        idLabel.font = .systemFont(ofSize: 16, weight: .regular)
        idLabel.textColor = UIColor.onBackground
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.primary?.withAlphaComponent(0.5)
        selectedBackgroundView = backgroundView
    }}
