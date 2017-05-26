//
//  CellViewModels.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit

protocol CellViewModelType { }

protocol CellConfigurable {
    associatedtype ViewModelType: CellViewModelType
    func configure(with viewModel: ViewModelType)
}

struct KeyBoardCellViewModel: CellViewModelType {

    let titleField: String
    let synthesizerField: String
    let numberOfKeyField: String
    let image: UIImage
    
    init(_ instrument: KeyedInstrument) {
        titleField = instrument.hasSynthesizer ? "Keyboard" : "Grand Piano"
        synthesizerField = instrument.hasSynthesizer ? "Equipped with synthesizer" : "Not Equipped with synthesizer"
        numberOfKeyField = "Keys: \(instrument.numberOfKeys)"
        image = instrument.hasSynthesizer ? #imageLiteral(resourceName: "keyboard.png") : #imageLiteral(resourceName: "grandPiano.jpeg")
    }
}

struct GuitarCellViewModel: CellViewModelType {
    
    let titleField: String
    let stringField: String
    let image: UIImage
    
    init(_ instrument: Guitar) {
        
        switch instrument.type {
        case .electric:
            titleField = "Electric Guitar"
            image = #imageLiteral(resourceName: "electric.jpg")
        case .acoustic:
            titleField = "Acoustic Guitar"
            image = #imageLiteral(resourceName: "acoustic.png")
        }
        stringField = "Strings: \(instrument.numberOfStrings)"
    }
}

struct AccessoryViewModel: CellViewModelType {
    
    let titleField: String
    let detailField: String
    let image: UIImage
    

    init(_ instrument: MusicalAccessory) {
        switch instrument {
        case let instrument as Tuner:
            self.init(instrument)
        case let instrument as GuitarPick:
            self.init(instrument)
        default:
            fatalError("Improper type")
        }
    }
    
    init(_ tuner: Tuner) {
        titleField = "Digital Tuner"
        detailField = "Frequency: \(tuner.frequency) Hz"
        image = #imageLiteral(resourceName: "tuner.png")
    }
    
    init(_ pick: GuitarPick) {
        titleField = "Guitar Pick"
        detailField = "Weight: \(pick.weight.rawValue)"
        image = #imageLiteral(resourceName: "pick.png")
    }

}
