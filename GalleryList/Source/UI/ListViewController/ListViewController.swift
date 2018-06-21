//
//  ListViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    var managers: [Manager]?
    var workers: [Worker]?
    var bookkeepers: [Bookkeeper]?
    
    // MARK: - ViewController lifecycle
    
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showItemVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(makeEditing))
    }
    
    @objc private func showItemVC() {
        let navigationVC = UINavigationController(rootViewController: ItemViewController())
        
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @objc private func makeEditing() {
        
    }
}
