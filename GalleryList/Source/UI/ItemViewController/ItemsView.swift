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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureView()
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
