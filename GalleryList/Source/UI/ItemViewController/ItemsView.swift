//
//  ItemsView.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class ItemsView: UIView {
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var nameTextField: UITextField?
    
    @IBOutlet var salaryLabel: UILabel?
    @IBOutlet var salaryTextField: UITextField?
    
    @IBOutlet var businessHoursLabel: UILabel?
    @IBOutlet var businessHoursTextField: UITextField?
    
    @IBOutlet var workplaceNumberLabel: UILabel?
    @IBOutlet var workplaceNumberTextField: UITextField?
    
    @IBOutlet var lunchTimeLabel: UILabel?
    @IBOutlet var lunchTimeTextField: UITextField?
    
    @IBOutlet var bookkeeperTypeLabel: UILabel?
    @IBOutlet var bookkeeperTypeTextField: UITextField?
    
    @IBOutlet var typeSegmentedControl: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureView()
    }
    
    // MARK: - Public
    
    func configureViewElements(with index: Int) {
        let UIElements = [self.workplaceNumberTextField, self.workplaceNumberLabel,
                          self.lunchTimeTextField, self.lunchTimeLabel,
                          self.bookkeeperTypeLabel, self.bookkeeperTypeTextField,
                          self.businessHoursTextField, self.businessHoursLabel]

        for element in UIElements {
            element?.isHidden = false
        }
        
        switch index {
        case 0:
            self.workplaceNumberLabel?.isHidden = true
            self.workplaceNumberTextField?.isHidden = true
            
            self.lunchTimeLabel?.isHidden = true
            self.lunchTimeTextField?.isHidden = true
            
            self.bookkeeperTypeLabel?.isHidden = true
            self.bookkeeperTypeTextField?.isHidden = true
        case 1:
            self.businessHoursLabel?.isHidden = true
            self.businessHoursTextField?.isHidden = true
            
            self.bookkeeperTypeTextField?.isHidden = true
            self.bookkeeperTypeLabel?.isHidden = true
        case 2:
            self.businessHoursTextField?.isHidden = true
            self.businessHoursLabel?.isHidden = true
        default:
            print("default")
        }
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.nameLabel?.text = ItemVCLabels.name.rawValue
        self.salaryLabel?.text = ItemVCLabels.salary.rawValue
        self.businessHoursLabel?.text = ItemVCLabels.businessHours.rawValue
        self.workplaceNumberLabel?.text = ItemVCLabels.workplaceNumber.rawValue
        self.lunchTimeLabel?.text = ItemVCLabels.lunchTime.rawValue
        self.bookkeeperTypeLabel?.text = ItemVCLabels.bookkeeperType.rawValue
    }
}
