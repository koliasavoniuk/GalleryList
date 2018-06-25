//
//  ItemsView.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit
import SwiftRangeSlider

class ItemsView: UIView, TimeStringProcessor {
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
            self.configureManagerElements()
        case 1:
            self.configureWorkerElements()
        case 2:
            self.configureBookkeeperElements()
        default:
            print("default")
        }
    }
    
    func updateTime(lowerSeconds: Double, upperSeconds: Double) {
        self.startValueTextField.text = self.timeStringFromSeconds(seconds: lowerSeconds)
        self.finishValueTextField.text = self.timeStringFromSeconds(seconds: upperSeconds)
    }
    
    // MARK: - View filling
    
    func configureManagerView(manager: Manager) {
        self.nameTextField?.text = manager.name
        self.salaryTextField?.text = String(describing: manager.salary)
        self.startValueTextField.text = self.timeStringFromSeconds(seconds: manager.businessHoursStart)
        self.finishValueTextField.text = self.timeStringFromSeconds(seconds: manager.businessHoursFinish)
        self.businessHoursSlider?.lowerValue = manager.businessHoursStart
        self.businessHoursSlider?.upperValue = manager.businessHoursFinish
        
        self.configureManagerElements()
        self.typeSegmentedControl.selectedSegmentIndex = 0
    }
    
    func configureWorkerView(worker: Worker) {
        self.nameTextField?.text = worker.name
        self.salaryTextField?.text = String(describing: worker.salary)
        self.workplaceNumberTextField?.text = String(describing: worker.workplaceNumber)
        self.startValueTextField.text = self.timeStringFromSeconds(seconds: worker.lunchTimeStart)
        self.finishValueTextField.text = self.timeStringFromSeconds(seconds: worker.lunchTimeFinish)
        self.lunchTimeSlider?.lowerValue = worker.lunchTimeStart
        self.lunchTimeSlider?.upperValue = worker.lunchTimeFinish
        
        self.configureWorkerElements()
        self.typeSegmentedControl.selectedSegmentIndex = 1
    }
    
    func configureBookkeeperView(bookkeeper: Bookkeeper) {
        self.nameTextField?.text = bookkeeper.name
        self.salaryTextField?.text = String(describing: bookkeeper.salary)
        self.workplaceNumberTextField?.text = String(describing: bookkeeper.workplaceNumber)
        self.startValueTextField.text = self.timeStringFromSeconds(seconds: bookkeeper.lunchTimeStart)
        self.finishValueTextField.text = self.timeStringFromSeconds(seconds: bookkeeper.lunchTimeFinish)
        self.lunchTimeSlider?.lowerValue = bookkeeper.lunchTimeStart
        self.lunchTimeSlider?.upperValue = bookkeeper.lunchTimeFinish
        
        if bookkeeper.type == .payroll {
            self.bookkeeperTypeSegmentedControl?.selectedSegmentIndex = 0
        } else if bookkeeper.type == .materialAccounting {
            self.bookkeeperTypeSegmentedControl?.selectedSegmentIndex = 1
        }
        
        self.configureBookkeeperElements()
        self.typeSegmentedControl.selectedSegmentIndex = 2
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
        self.finishValueTextField.text = self.timeStringFromSeconds(seconds: (self.lunchTimeSlider?.upperValue) ?? 0.0)
        self.startValueTextField.text = self.timeStringFromSeconds(seconds: (self.lunchTimeSlider?.lowerValue) ?? 0.0)
    }
    
    private func configureManagerElements() {
        self.workplaceNumberLabel?.isHidden = true
        self.workplaceNumberTextField?.isHidden = true
        
        self.lunchTimeLabel?.isHidden = true
        self.lunchTimeSlider?.isHidden = true
        
        self.bookkeeperTypeLabel?.isHidden = true
        self.bookkeeperTypeSegmentedControl?.isHidden = true
    }
    
    private func configureWorkerElements() {
        self.businessHoursLabel?.isHidden = true
        self.businessHoursSlider?.isHidden = true
        
        self.bookkeeperTypeSegmentedControl?.isHidden = true
        self.bookkeeperTypeLabel?.isHidden = true
    }
    
    private func configureBookkeeperElements() {
        self.businessHoursSlider?.isHidden = true
        self.businessHoursLabel?.isHidden = true
    }
}
