//
//  ListTableViewCell.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/23/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell, TimeStringProcessor {

    @IBOutlet var photoView: UIImageView!
    @IBOutlet var infoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public
    
    func fill(with model: ParentWorker, photo: UIImage) {
        if type(of: model) == Manager.self {
            self.imageView?.image = photo
            self.fillManager(manager: model as? Manager)
            
        } else if type(of: model) == Worker.self {
            self.imageView?.image = photo
            self.fillWorker(worker: model as? Worker)
            
        } else if type(of: model) == Bookkeeper.self {
            self.imageView?.image = photo
            self.fillBookkeeper(bookkeeper: model as? Bookkeeper)
        }
    }
    
    // MARK: - Private
    
    private func fillManager(manager: Manager?) {
        let name = manager?.name ?? ""
        let salary = " salary: " + String(describing: manager?.salary ?? 0)
        let businessHours = " business hours: " +
            String(describing: self.timeStringFromSeconds(seconds: manager?.businessHoursStart ?? 0.0)) +
            " - " +
            String(describing: self.timeStringFromSeconds(seconds: manager?.businessHoursFinish ?? 0.0))
        
        self.infoLabel.text = name + salary + businessHours
    }
    
    private func fillWorker(worker: Worker?) {
        let name = worker?.name ?? ""
        let salary = " salary: " + String(describing: worker?.salary ?? 0)
        let workplace = "workplace: " + String(describing: worker?.workplaceNumber ?? 0)
        let lunchTimeHours = " lunch: " +
            String(describing: self.timeStringFromSeconds(seconds: worker?.lunchTimeStart ?? 0.0)) +
            " - " +
            String(describing: self.timeStringFromSeconds(seconds: worker?.lunchTimeFinish ?? 0.0))
        
        self.infoLabel.text = name + salary + workplace + lunchTimeHours
    }
    
    private func fillBookkeeper(bookkeeper: Bookkeeper?) {
        let name = bookkeeper?.name ?? ""
        let salary = " salary: " + String(describing: bookkeeper?.salary ?? 0)
        let workplace = " workplace: " + String(describing: bookkeeper?.workplaceNumber ?? 0)
        let lunchTimeHours = " lunch: " +
            String(describing: self.timeStringFromSeconds(seconds: bookkeeper?.lunchTimeStart ?? 0.0)) +
            " - " +
            String(describing: self.timeStringFromSeconds(seconds: bookkeeper?.lunchTimeFinish ?? 0.0))
        let type = String(describing: bookkeeper?.type).split(separator: ".")
        let bookkeeperType = " type: " + String(type.last?.dropLast() ?? "")
        
        self.infoLabel.text = name + salary + workplace + lunchTimeHours + bookkeeperType
    }
}
