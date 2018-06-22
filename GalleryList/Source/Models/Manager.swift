//
//  Manager.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

class Manager: ParentWorker {
    let businessHoursStart: Double
    let businessHoursFinish: Double
    
    init(salary: Int, name: String, businessHoursStart: Double, businessHoursFinish: Double) {
        self.businessHoursStart = businessHoursStart
        self.businessHoursFinish = businessHoursFinish
        
        super.init(salary: salary, name: name)
    }
}
