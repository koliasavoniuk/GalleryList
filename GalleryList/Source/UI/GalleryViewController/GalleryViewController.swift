//
//  GalleryViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }

    // MARK: - Private
    
    private func configureView() {
        self.navigationItem.title = VCTitles.gallery.rawValue
    }
}
