//
//  KeyboardTableViewCell.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import UIKit

class KeyboardTableViewCell: UITableViewCell {

    @IBOutlet var instrumentImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var synthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension KeyboardTableViewCell: CellConfigurable {
    
    func configure(with viewModel: KeyBoardCellViewModel) {
     
        self.instrumentImageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleField
        self.detailLabel.text = viewModel.numberOfKeyField
        self.synthLabel.text = viewModel.synthesizerField
    }
}
