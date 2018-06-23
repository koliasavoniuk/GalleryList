//
//  UITableView+Extensions.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/23/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

extension UITableView {
    /**
     Create UINib object based on cells type and register nib with cell type as identifier
     */
    func register(cells: Set<String>) {
        cells.forEach { type in
            self.register(cell:type)
        }
    }
    
    func register(cells: String...) {
        self.register(cells: Set(cells))
    }
    
    func register(cells: UITableViewCell.Type...) {
        self.register(cells: Set(cells.map { toString($0) }))
    }
    
    func register(cellClass: UITableViewCell.Type) {
        self.register(cell: toString(cellClass))
    }
    
    func register(cell: String) {
        let nib = UINib.init(nibName: cell, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cell)
    }
    
    func register(headerFooters: [String]) {
        headerFooters.forEach { type in
            self.register(headerFooter:type)
        }
    }
    
    func register(headerFooter: String) {
        let nib = UINib.init(nibName: headerFooter, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: headerFooter)
    }
    
    func register(headerFooterClass: AnyClass) {
        self.register(headerFooter: toString(headerFooterClass))
    }
}
