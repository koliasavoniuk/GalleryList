//
//  ItemViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var rootView: ItemsView!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.configureNavigationItem()
        self.configureSegmentedControl()
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.navigationItem.title = VCTitles.item.rawValue
    }
    
    private func configureSegmentedControl() {
        self.rootView.typeSegmentedControl.addTarget(self, action: #selector(self.segmentedControlValueChanged), for: .valueChanged)
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveItem))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: BarButtonItems.back.rawValue, style: .plain, target: self, action: #selector(self.back))
    }
    
    @objc private func saveItem() {
//        let object: ParentModel?
//        
//        switch self.rootView.typeSegmentedControl.selectedSegmentIndex {
//        case 0:
//            object = Manager(salary: Int((self.rootView.salaryTextField?.accessibilityValue)!)!,
//                                 name: (self.rootView.nameTextField?.accessibilityValue)!,
//                                 businessHours: (self.rootView.businessHoursTextField?.accessibilityValue?.toDouble())!)
//        case 1:
//            object = Worker(salary: Int((self.rootView.salaryTextField?.accessibilityValue)!)!,
//                            name: (self.rootView.nameTextField?.accessibilityValue)!,
//                            workplaceNumber: Int((self.rootView.workplaceNumberTextField?.accessibilityValue)!)!,
//                            lunchTime: (self.rootView.lunchTimeTextField?.accessibilityValue?.toDouble())!)
//        case 2:
//            let bookkeeperType: BookkeeperType?
//            
//            if self.rootView.bookkeeperTypeSegmentedControl?.selectedSegmentIndex == 0 {
//                bookkeeperType = .payroll
//            } else {
//                bookkeeperType = .materialAccounting
//            }
//            
//            object = Bookkeeper(type: bookkeeperType!,
//                                salary: Int((self.rootView.salaryTextField?.accessibilityValue)!)!,
//                                name: (self.rootView.nameTextField?.accessibilityValue)!,
//                                workplaceNumber: Int((self.rootView.workplaceNumberTextField?.accessibilityValue)!)!,
//                                lunchTime: (self.rootView.lunchTimeTextField?.accessibilityValue?.toDouble())!)
//        default:
//            print("FF")
//        }
//        
//        
    }
    
    @objc private func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func segmentedControlValueChanged() {
        self.rootView.configureViewElements(with: self.rootView.typeSegmentedControl.selectedSegmentIndex)
    }
}
