//
//  ItemViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit
import SwiftRangeSlider

enum ItemOption {
    case new
    case edit
}

class ItemViewController: UIViewController {
    typealias completionHandler<T: ParentWorker> = (T) -> ()
    
    var option: ItemOption
    var completionHandler: completionHandler<ParentWorker>?
    
    // MARK: - Properties
    
    @IBOutlet var rootView: ItemsView!
    
    // MARK: - Initializations and Deallocations
    
    init(option: ItemOption) {
        self.option = option
        
        super.init(nibName: "ItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.configureNavigationItem()
        self.configureWorkerTypeSegmentedControl()
    }
    
    // MARK: - IBActions
    
    @IBAction func onLunchTimeRangeSlider(_ sender: RangeSlider) {
        self.rootView.updateTime(lowerSeconds: sender.lowerValue, upperSeconds: sender.upperValue)
    }
    
    @IBAction func onBusinessHoursRangeSlider(_ sender: RangeSlider) {
        self.rootView.updateTime(lowerSeconds: sender.lowerValue, upperSeconds: sender.upperValue)
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.navigationItem.title = VCTitles.item.rawValue
    }
    
    private func configureWorkerTypeSegmentedControl() {
        self.rootView.typeSegmentedControl.addTarget(self,
                                                     action: #selector(self.workerTypeSegmentedControlValueChanged),
                                                     for: .valueChanged)
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveItem))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: BarButtonItems.back.rawValue, style: .plain, target: self, action: #selector(self.back))
    }
    
    @objc private func saveItem() {
        switch self.rootView.typeSegmentedControl.selectedSegmentIndex {
        case 0:
            self.saveManager()
        case 1:
            self.saveWorker()
        case 2:
            self.saveBookkeeper()
        default:
            print("FF")
        }
    }
    
    @objc private func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func workerTypeSegmentedControlValueChanged() {
        self.rootView.configureViewElements(with: self.rootView.typeSegmentedControl.selectedSegmentIndex)
    }
    
    private func getSecondsFromTimeString(timeString: String) -> Double {
        let seconds = timeString.split(separator: ":")
        let result = Double(seconds[0])! * 3600 + Double(seconds[1])! * 60
        return result
    }
    
    // MARK: - Object creating
    
    private func saveWorker() {
        let object = Worker(salary: Int((self.rootView.salaryTextField?.text) ?? "") ?? 0,
                        name: (self.rootView.nameTextField?.text) ?? "",
                        workplaceNumber: Int((self.rootView.workplaceNumberTextField?.text) ?? "") ?? 0,
                        lunchTimeStart: self.getSecondsFromTimeString(timeString: self.rootView.startValueTextField.text ?? ""),
                        lunchTimeFinish: self.getSecondsFromTimeString(timeString: self.rootView.finishValueTextField.text ?? ""))
        
        self.completionHandler!(object)
    }
    
    private func saveManager() {
        let object = Manager(salary: Int((self.rootView.salaryTextField?.text) ?? "") ?? 0,
                         name: (self.rootView.nameTextField?.text) ?? "",
                         businessHoursStart: self.getSecondsFromTimeString(timeString: self.rootView.startValueTextField.text ?? ""),
                         businessHoursFinish: self.getSecondsFromTimeString(timeString: self.rootView.finishValueTextField.text ?? ""))
        
        self.completionHandler!(object)
    }
    
    private func saveBookkeeper() {
        let bookkeeperType: BookkeeperType?
        
        if self.rootView.bookkeeperTypeSegmentedControl?.selectedSegmentIndex == 0 {
            bookkeeperType = .payroll
        } else {
            bookkeeperType = .materialAccounting
        }
        
        let object = Bookkeeper(type: bookkeeperType!,
                            salary: Int((self.rootView.salaryTextField?.text) ?? "") ?? 0,
                            name: (self.rootView.nameTextField?.text) ?? "",
                            workplaceNumber: Int((self.rootView.workplaceNumberTextField?.text) ?? "") ?? 0,
                            lunchTimeStart: self.getSecondsFromTimeString(timeString: self.rootView.startValueTextField.text ?? ""),
                            lunchTimeFinish: self.getSecondsFromTimeString(timeString: self.rootView.finishValueTextField.text ?? ""))

        self.completionHandler!(object)
    }
}
