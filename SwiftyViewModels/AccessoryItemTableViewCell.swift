//
//  AccessoryItemTableViewCell.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import UIKit

class AccessoryItemTableViewCell: UITableViewCell {

    @IBOutlet var instrumentImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
}

extension AccessoryItemTableViewCell: CellConfigurable {
    
    func configure(with viewModel: AccessoryViewModel) {
        self.instrumentImageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleField
        self.detailLabel.text = viewModel.detailField
    }
    
}
