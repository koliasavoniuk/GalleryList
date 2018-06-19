//
//  ItemViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet var rootView: ItemsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.configureNavigationItem()
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.navigationItem.title = VCTitles.item.rawValue
    }
    
    private func configureNavigationItem() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveItem))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: BarButtonItems.back.rawValue, style: .plain, target: self, action: #selector(back))
    }
    
    @objc private func saveItem() {
        
    }
    
    @objc private func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
