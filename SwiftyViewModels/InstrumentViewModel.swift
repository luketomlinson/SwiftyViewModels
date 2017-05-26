//
//  InstrumentViewModel.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit

fileprivate enum Section:Int {
    case guitar = 0
    case keyboard
    case accessory
    
    static let all:[Section] = [.guitar, .keyboard, .accessory]
}

struct InstrumentViewModel {
        
    let guitarViewModels: [GuitarCellViewModel]
    let keyboardViewModels: [KeyBoardCellViewModel]
    let accessoryViewModels: [AccessoryViewModel]
    
    var sectionCount: Int {
        return Section.all.count
    }
    
    
    init(guitars: [Guitar], keyboards: [KeyedInstrument], accessories: [MusicalAccessory]) {
        
        self.guitarViewModels = guitars.map(GuitarCellViewModel.init)
        self.keyboardViewModels = keyboards.map(KeyBoardCellViewModel.init)
        self.accessoryViewModels = accessories.map(AccessoryViewModel.init)
    }
    
    func numberOfItems(in sectionIndex: Int) -> Int {
        guard let section = Section(rawValue: sectionIndex) else { return 0 }
        
        switch section {
        case .guitar:
            return guitarViewModels.count
        case .keyboard:
            return keyboardViewModels.count
        case .accessory:
            return accessoryViewModels.count
        }
    }
    
    func viewModel(for indexPath: IndexPath) -> CellViewModelType {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("Invalid section")
        }
        
        switch section {
        case .guitar:
            return guitarViewModels[indexPath.row]
        case .keyboard:
            return keyboardViewModels[indexPath.row]
        case .accessory:
            return accessoryViewModels[indexPath.row]
        }

    }
    
    func cellType(for indexPath: IndexPath) -> NibLoadable.Type {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("Invalid section")
        }
        
        switch section {
        case .guitar:
            return GuitarTableViewCell.self
        case .keyboard:
            return KeyboardTableViewCell.self
        case .accessory:
            return AccessoryItemTableViewCell.self
        }
    }
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        
        let viewModel = self.viewModel(for: indexPath)
        
        switch (cell, viewModel) {
        case (let cell as GuitarTableViewCell, let viewModel as GuitarCellViewModel):
            cell.configure(with: viewModel)
        case (let cell as KeyboardTableViewCell, let viewModel as KeyBoardCellViewModel):
            cell.configure(with: viewModel)
        case (let cell as AccessoryItemTableViewCell, let viewModel as AccessoryViewModel):
            cell.configure(with: viewModel)
        default:
            fatalError("Mismatched cell and view model")
            
        }
    }
}
