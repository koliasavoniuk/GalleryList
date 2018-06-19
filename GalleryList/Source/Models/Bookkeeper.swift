//
//  Bookkeeper.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

enum BookkeeperType {
    case payroll
    case materialAccounting
}

class Bookkeeper: Worker {
    let type: BookkeeperType
    
    init(type: BookkeeperType, salary: Int, name: String, workplaceNumber: Int, lunchTime: Double) {
        self.type = type
        
        super.init(salary: salary, name: name, workplaceNumber: workplaceNumber, lunchTime: lunchTime)
    }
}
