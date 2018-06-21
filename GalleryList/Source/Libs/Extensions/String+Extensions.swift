//
//  String+Extensions.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/21/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
