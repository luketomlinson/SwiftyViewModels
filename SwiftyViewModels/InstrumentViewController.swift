//
//  InstrumentViewController.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import UIKit

let guitarInventory: [Guitar] = [Guitar(type: .electric, numberOfStrings: 6), Guitar(type: .acoustic, numberOfStrings: 12)]
let keyBoardInventory: [KeyedInstrument] = [Keyboard(numberOfKeys: 76), GrandPiano(numberOfKeys: 88)]
let accessoryInventory: [MusicalAccessory] = [GuitarPick(weight: .medium), Tuner(frequency: 441.0)]


class InstrumentViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let viewModel = InstrumentViewModel(guitars: guitarInventory, keyboards: keyBoardInventory, accessories: accessoryInventory)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    func registerCells() {
        tableView.register(cell: GuitarTableViewCell.self)
        tableView.register(cell: KeyboardTableViewCell.self)
        tableView.register(cell: AccessoryItemTableViewCell.self)
    }
}

extension InstrumentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = viewModel.cellType(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath)

        viewModel.configureCell(cell, at: indexPath)
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
}

extension InstrumentViewController: UITableViewDelegate {
    
}
