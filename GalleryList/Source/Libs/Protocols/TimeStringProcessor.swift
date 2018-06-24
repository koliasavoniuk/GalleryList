//
//  TimeStringProcessor.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/24/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation

protocol TimeStringProcessor {
    func timeStringFromSeconds(seconds: Double) -> String
    func getSecondsFromTimeString(timeString: String) -> Double
}

extension TimeStringProcessor {
    func timeStringFromSeconds(seconds: Double) -> String {
        let dcFormatter = DateComponentsFormatter()
        dcFormatter.zeroFormattingBehavior = DateComponentsFormatter.ZeroFormattingBehavior.pad
        dcFormatter.allowedUnits = [NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        dcFormatter.unitsStyle = DateComponentsFormatter.UnitsStyle.positional
        return dcFormatter.string(from: seconds)!
    }
    
    func getSecondsFromTimeString(timeString: String) -> Double {
        var time: String
        
        if timeString == "" {
            time = "0:00"
        } else {
            time = timeString
        }
        
        let seconds = time.split(separator: ":")
        let result = Double(seconds[0])! * 3600 + Double(seconds[1])! * 60
        return result
    }
}
