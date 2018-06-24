//
//  StaffModel.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/24/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

struct Staff {
    var managers = [Manager]()
    var workers = [Worker]()
    var bookkeepers = [Bookkeeper]()
    let count = 3
    
    //I tried to imlpement generic subscript, but Xcode always fails with no warnings and errors
    //It may be Hackintosh bug((
    subscript(index: Int) -> [ParentWorker] {
        get {
            var parentWorkers = [ParentWorker]()
            
            switch index {
            case 0:
                parentWorkers = self.managers
            case 1:
                parentWorkers = self.workers
            case 2:
                parentWorkers = self.bookkeepers
            default:
                print("default")
            }
            
            return parentWorkers
        }
        
        set(someWorkers) {
            switch index {
            case 0:
                self.managers = someWorkers as! [Manager]
            case 1:
                self.workers = someWorkers as! [Worker]
            case 2:
                self.bookkeepers = someWorkers as! [Bookkeeper]
            default:
                print("default")
            }
        }
    }
}
