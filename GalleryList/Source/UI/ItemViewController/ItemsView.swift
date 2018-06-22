//
//  ItemsView.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit
import SwiftRangeSlider

class ItemsView: UIView {
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var nameTextField: UITextField?
    
    @IBOutlet var salaryLabel: UILabel?
    @IBOutlet var salaryTextField: UITextField?
    
    @IBOutlet var businessHoursLabel: UILabel?
    @IBOutlet var businessHoursSlider: RangeSlider?
    
    @IBOutlet var workplaceNumberLabel: UILabel?
    @IBOutlet var workplaceNumberTextField: UITextField?
    
    @IBOutlet var lunchTimeLabel: UILabel?
    @IBOutlet var lunchTimeSlider: RangeSlider?
    
    @IBOutlet var bookkeeperTypeLabel: UILabel?
    @IBOutlet var bookkeeperTypeSegmentedControl: UISegmentedControl?
    
    @IBOutlet var typeSegmentedControl: UISegmentedControl!
    @IBOutlet var startValueTextField: UITextField!
    @IBOutlet var finishValueTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureView()
    }
    
    // MARK: - Public
    
    func configureViewElements(with index: Int) {
        let UIElements = [self.workplaceNumberTextField, self.workplaceNumberLabel,
                          self.lunchTimeSlider, self.lunchTimeLabel,
                          self.bookkeeperTypeLabel, self.bookkeeperTypeSegmentedControl,
                          self.businessHoursSlider, self.businessHoursLabel]

        for element in UIElements {
            element?.isHidden = false
        }
        
        switch index {
        case 0:
            self.workplaceNumberLabel?.isHidden = true
            self.workplaceNumberTextField?.isHidden = true
            
            self.lunchTimeLabel?.isHidden = true
            self.lunchTimeSlider?.isHidden = true
            
            self.bookkeeperTypeLabel?.isHidden = true
            self.bookkeeperTypeSegmentedControl?.isHidden = true
        case 1:
            self.businessHoursLabel?.isHidden = true
            self.businessHoursSlider?.isHidden = true
            
            self.bookkeeperTypeSegmentedControl?.isHidden = true
            self.bookkeeperTypeLabel?.isHidden = true
        case 2:
            self.businessHoursSlider?.isHidden = true
            self.businessHoursLabel?.isHidden = true
        default:
            print("default")
        }
    }
    
    func updateTime(lowerSeconds: Double, upperSeconds: Double) {
        self.startValueTextField.text = self.getTimeStringFromSeconds(seconds: lowerSeconds)
        self.finishValueTextField.text = self.getTimeStringFromSeconds(seconds: upperSeconds)
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.nameLabel?.text = ItemVCLabels.name.rawValue
        self.salaryLabel?.text = ItemVCLabels.salary.rawValue
        self.businessHoursLabel?.text = ItemVCLabels.businessHours.rawValue
        self.workplaceNumberLabel?.text = ItemVCLabels.workplaceNumber.rawValue
        self.lunchTimeLabel?.text = ItemVCLabels.lunchTime.rawValue
        self.bookkeeperTypeLabel?.text = ItemVCLabels.bookkeeperType.rawValue
        
        //FIXME: Hardcoded values, SwiftRangeSlider brakes IB sizes
        self.lunchTimeSlider?.frame.size.height = 30.0
        self.businessHoursSlider?.frame.size.height = 30.0
    }
    
    @objc private func lunchTimeSliderValueHasChanged() {
        self.finishValueTextField.text = self.getTimeStringFromSeconds(seconds: (self.lunchTimeSlider?.upperValue)!)
        self.startValueTextField.text = self.getTimeStringFromSeconds(seconds: (self.lunchTimeSlider?.lowerValue)!)
    }
    
    private func getTimeStringFromSeconds(seconds: Double) -> String {
        let dcFormatter = DateComponentsFormatter()
        dcFormatter.zeroFormattingBehavior = DateComponentsFormatter.ZeroFormattingBehavior.pad
        dcFormatter.allowedUnits = [NSCalendar.Unit.hour, NSCalendar.Unit.minute]
        dcFormatter.unitsStyle = DateComponentsFormatter.UnitsStyle.positional
        return dcFormatter.string(from: seconds)!
    }
}
