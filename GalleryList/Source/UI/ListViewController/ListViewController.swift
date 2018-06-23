//
//  ListViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit
import Foundation

struct Workers {
    var managers = [Manager]()
    var workers = [Worker]()
    var bookkeepers = [Bookkeeper]()
    let count = 3
    
    subscript (index: Int) -> [ParentWorker] {
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
    
    var workerss = Workers()
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureNavigationItem()
        self.configureTableVC()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workerss[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.workerss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: toString(ListTableViewCell.self), for: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(describing: type(of: self.workerss[section]))
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
        
        controller.workerHandler = { [weak self] worker in
            if type(of: worker) == Worker.self {
                self?.workerss.workers.append(worker as! Worker)
            } else if type(of: worker) == Manager.self {
                self?.workerss.managers.append(worker as! Manager)
            } else if type(of: worker) == Bookkeeper.self {
                self?.workerss.bookkeepers.append(worker as! Bookkeeper)
            }
            
            self?.rootView.tableView.reloadData()
            
            controller.dismiss(animated: true, completion: nil)
        }
        
        let navigationVC = UINavigationController(rootViewController: controller)
            
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @objc private func makeEditing() {
        
    }
}
