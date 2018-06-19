//
//  ListViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureNavigationItem()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: - Private
    
    private func configureView() {
        self.navigationItem.title = VCTitles.list.rawValue
    }
    
    private func configureNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(makeEditing))
    }
    
    @objc private func showAddVC() {
        
    }
    
    @objc private func makeEditing() {
        
    }
}
