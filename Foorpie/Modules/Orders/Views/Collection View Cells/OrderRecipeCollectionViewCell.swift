//
//  OrderRecipeCollectionViewCell.swift
//  Cottura
//
//  Created by Ignacio Paradisi on 8/29/20.
//  Copyright © 2020 Ignacio Paradisi. All rights reserved.
//

import UIKit

class OrderRecipeCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {

    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var statusButton: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var availabilityLabel: UILabel!
    @IBOutlet private weak var availabilityStepper: UIStepper!
    @IBOutlet private weak var priceLabel: UILabel!
    private var isReady = false
    private var availableCount: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusButton.setTitle(Localizable.Button.done, for: .normal)
        priceLabel.font = UIFont.preferredFont(forTextStyle: .title2).bold
        statusButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote).bold
        availabilityStepper.value = Double(availableCount)
    }

    @IBAction func didTapStatusButton(_ sender: UIButton) {
        isReady.toggle()
        UISelectionFeedbackGenerator().selectionChanged()
        statusButton.shrink()
        statusButton.backgroundColor = isReady ? .systemGreen : .systemGray3
        statusButton.setTitleColor(isReady ? .white : .lightText, for: .normal)
        statusButton.tintColor = isReady ? .white : .lightText
    }
    @IBAction func stepperValueDidChange(_ sender: UIStepper) {
        availabilityLabel.text = "\(Int(sender.value))"
        priceLabel.text = "$\(7 * sender.value)"
    }

}
