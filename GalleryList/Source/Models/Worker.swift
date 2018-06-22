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
    let lunchTimeStart: Double
    let lunchTimeFinish: Double
    
    init(salary: Int, name: String, workplaceNumber: Int, lunchTimeStart: Double, lunchTimeFinish: Double) {
        self.workplaceNumber = workplaceNumber
        self.lunchTimeStart = lunchTimeStart
        self.lunchTimeFinish = lunchTimeFinish
        
        super.init(salary: salary, name: name)
    }
}
