//
//  Worker.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

class Worker: ParentModel {
    let workplaceNumber: Int
    let lunchTime: Double
    
    init(salary: Int, name: String, workplaceNumber: Int, lunchTime: Double) {
        self.workplaceNumber = workplaceNumber
        self.lunchTime = lunchTime
        
        super.init(salary: salary, name: name)
    }
}
