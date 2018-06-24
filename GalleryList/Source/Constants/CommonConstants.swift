//
//  CommonConstants.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

// MARK: - Pictures

//cases must have similar names with asset images
enum PictureName: String {
    case gallery_icon
    case list_icon
}

// MARK: - ViewController Titles

enum VCTitles: String {
    case list = "List"
    case gallery = "Gallery"
    case item = "Item"
}

enum BarButtonItems: String {
    case back = "Back"
}

enum ItemVCLabels: String {
    case name = "Name"
    case salary = "Salary"
    case businessHours = "Business hours"
    case workplaceNumber = "Workplace number"
    case lunchTime = "Lunch time"
    case bookkeeperType = "Bookkeeper type"
}
