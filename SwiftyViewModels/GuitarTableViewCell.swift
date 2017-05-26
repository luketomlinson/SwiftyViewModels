//
//  GuitarTableViewCell.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import UIKit

class GuitarTableViewCell: UITableViewCell {

    @IBOutlet var instrumentImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!

}

extension GuitarTableViewCell: CellConfigurable {
    
    func configure(with viewModel: GuitarCellViewModel) {
        
        self.instrumentImageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleField
        self.detailLabel.text = viewModel.stringField
    }
}
