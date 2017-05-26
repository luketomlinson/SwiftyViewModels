//
//  CellViewModels.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import Foundation

protocol CellViewModelType { }

protocol CellConfigurable {
    associatedtype ViewModelType: CellViewModelType
    func configure(with viewModel: ViewModelType)
}

struct KeyBoardCellViewModel: CellViewModelType {

    let titleField: String
    let synthesizerField: String
    let numberOfKeyField: String
    
    init(instrument: KeyedInstrument) {
        titleField = instrument.hasSynthesizer ? "Keyboard" : "Grand Piano"
        synthesizerField = instrument.hasSynthesizer ? "Equipped with synthesizer" : "Not Equipped with synthesizer"
        numberOfKeyField = "Keys: \(instrument.numberOfKeys)"
    }
}

struct GuitarCellViewModel: CellViewModelType {
    
    let titleField: String
    let stringField: String
    
    init(instrument: Guitar) {
        
        switch instrument.type {
        case .electric:
            self.titleField = "Electric Guitar"
        case .acoustic:
            self.titleField = "Acoustic Guitar"
        }
        stringField = "Strings: \(instrument.numberOfStrings)"
    }
}

struct AccessoryViewModel: CellViewModelType {
    
    let titleField: String
    let detailField: String
    

    init(tuner: Tuner) {
        titleField = "Digital Tuner"
        detailField = "Frequency: \(tuner.frequency) Hz"
    }
    
    init(pick: GuitarPick) {
        titleField = "Guitar Pick"
        detailField = "Weight: \(pick.weight.rawValue)"
    }

}
