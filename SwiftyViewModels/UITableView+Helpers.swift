//
//  UICollectionView+Helpers.swift
//  SwiftyViewModels
//
//  Created by Luke Tomlinson on 5/26/17.
//  Copyright © 2017 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseIdentifiable {}
protocol NibLoadable:ReuseIdentifiable { }

extension ReuseIdentifiable {
    static var reuseIdentifier:String {
        return String(describing: self)
    }
}

extension NibLoadable {
    static var nib:UINib {
        let name = reuseIdentifier
        return UINib(nibName: name, bundle: .main)
    }
}

extension UITableViewCell: NibLoadable { }

extension UITableView {
    
    func register(cell: NibLoadable.Type) {
        let nib = cell.nib
        let identifier = cell.reuseIdentifier
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeue<T: NibLoadable>(cellType: T.Type, for indexPath: IndexPath) -> T {
        let dequeued = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as! T
        return dequeued
    }
}
