//
//  ListViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit
import Foundation

struct Staff {
    var managers = [Manager]()
    var workers = [Worker]()
    var bookkeepers = [Bookkeeper]()
    let count = 3
    
    //I tried to imlpement generic subscript, but Xcode always fails with no warnings and errors
    //It may be Hackintosh bug((
    subscript(index: Int) -> [ParentWorker] {
        var parentWorkers = [ParentWorker]()
        
        switch index {
        case 0:
            parentWorkers = self.managers
        case 1:
            parentWorkers = self.workers
        case 2:
            parentWorkers = self.bookkeepers
        default:
            print("default")
            
        }
        
        return parentWorkers
    }
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    @IBOutlet var rootView: ListView!
    
    var staff = Staff()
    let headerTitles = ["Managers", "Workers", "Bookkeepers"]
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureNavigationItem()
        self.configureTableVC()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.staff[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.staff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListTableViewCell = cast(tableView.dequeueReusableCell(withIdentifier: toString(ListTableViewCell.self), for: indexPath))!
        let photo = UIImage(named: "gallery_icon")
        cell.fill(with: self.staff[indexPath.section][indexPath.row], photo: photo!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headerTitles[section]
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - Private

    private func configureTableVC() {
        self.rootView.tableView.register(cells: ListTableViewCell.self)
    }
    
    private func configureView() {
        self.navigationItem.title = VCTitles.list.rawValue
    }
    
    private func configureNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showItemVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(makeEditing))
    }
    
    @objc private func showItemVC() {
        let controller = ItemViewController(option: .new)
        
        controller.completionHandler = { [weak self] someWorker in
            self?.saveSomeWorker(someWorker: someWorker)
            self?.rootView.tableView.reloadData()
            
            controller.dismiss(animated: true, completion: nil)
        }
        
        let navigationVC = UINavigationController(rootViewController: controller)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @objc private func makeEditing() {
        
    }
    
    private func saveSomeWorker(someWorker: ParentWorker) {
        if type(of: someWorker) == Worker.self {
            self.staff.workers.append(someWorker as! Worker)
        } else if type(of: someWorker) == Manager.self {
            self.staff.managers.append(someWorker as! Manager)
        } else if type(of: someWorker) == Bookkeeper.self {
            self.staff.bookkeepers.append(someWorker as! Bookkeeper)
        }
    }
    
}
