//
//  Models.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import Foundation

protocol MusicalProduct { }

protocol StringInstrument: MusicalProduct {
    var numberOfStrings: Int { get }
}

protocol KeyedInstrument: MusicalProduct {
    var numberOfKeys: Int { get }
    var hasSynthesizer: Bool { get }
}

protocol MusicalAccessory: MusicalProduct { }

struct Guitar: StringInstrument {
    
    enum GuitarType {
        case electric
        case acoustic
    }
    
    let type: GuitarType
    let numberOfStrings: Int
}

struct Keyboard: KeyedInstrument {
    
    var hasSynthesizer: Bool {
        return true
    }
    
    let numberOfKeys: Int
}

struct GrandPiano: KeyedInstrument {
    
    var hasSynthesizer: Bool {
        return false
    }
    
    let numberOfKeys: Int
}

struct Tuner: MusicalAccessory {
    let frequency: Double
}

struct GuitarPick: MusicalAccessory {
    
    enum GuitarPickWeight: String {
        case ultraLight = "Ultra Light"
        case light = "Light"
        case medium = "Medium"
        case heavy = "Heavy"
    }
    
    let weight: GuitarPickWeight
}
