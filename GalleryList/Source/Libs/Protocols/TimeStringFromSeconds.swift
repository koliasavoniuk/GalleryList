//
//  TimeStringFromSeconds.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/24/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

protocol TimeStringFromSeconds {
    func timeStringFromSeconds(seconds: Double) -> String
}

extension TimeStringFromSeconds {
    func timeStringFromSeconds(seconds: Double) -> String {
        let dcFormatter = DateComponentsFormatter()
        dcFormatter.zeroFormattingBehavior = DateComponentsFormatter.ZeroFormattingBehavior.pad
        dcFormatter.allowedUnits = [NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        dcFormatter.unitsStyle = DateComponentsFormatter.UnitsStyle.positional
        return dcFormatter.string(from: seconds)!
    }
}
