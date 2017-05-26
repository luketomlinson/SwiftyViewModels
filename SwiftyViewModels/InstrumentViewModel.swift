//
//  InstrumentViewModel.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import Foundation


fileprivate enum Section:Int {
    case guitar = 0
    case keyboard
    case accessory
    
    static let all:[Section] = [.guitar, .keyboard, .accessory]
}

struct InstrumentViewModel {
        
    let guitarInventory: [Guitar]
    let keyBoardInventory: [KeyedInstrument]
    let accessoryInventory: [MusicalAccessory]
    
    var sectionCount: Int {
        return Section.all.count
    }
    
    func numberOfItems(in sectionIndex: Int) -> Int {
        guard let section = Section(rawValue: sectionIndex) else { return 0 }
        
        switch section {
        case .guitar:
            return guitarInventory.count
        case .keyboard:
            return keyBoardInventory.count
        case .accessory:
            return accessoryInventory.count
        }
    }
    
    
    
}
