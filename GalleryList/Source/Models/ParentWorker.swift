//
//  ParentWorker.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

class ParentWorker: NSObject {
    let salary: Int
    let name: String
    
    init(salary: Int, name: String) {
        self.salary = salary
        self.name = name
    }
}
