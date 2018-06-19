//
//  Manager.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

class Manager: ParentModel {
    let businessHours: Double
    
    init(salary: Int, name: String, businessHours: Double) {
        self.businessHours = businessHours
        
        super.init(salary: salary, name: name)
    }
}
