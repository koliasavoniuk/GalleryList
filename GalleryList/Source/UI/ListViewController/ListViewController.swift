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
    
    var managers = [Manager]()
    var workers = [Worker]()
    var bookkeepers = [Bookkeeper]()
    
    let workerss = Workers()
    
    let headerTitles = ["Managers", "Workers", "Bookkeepers"]
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureNavigationItem()
        //String(describing: type(of: self.workerss.workers))
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.section {
        case 1:
            cell.textLabel?.text = self.managers[indexPath.section].name
        case 2:
            cell.textLabel?.text = self.workers[indexPath.section].name
        case 3:
            cell.textLabel?.text = self.bookkeepers[indexPath.section].name
        default:
            print("default")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headerTitles[section]
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
        let controller = ItemViewController(option: .new)
        
        controller.workerHandler = { [weak self] worker in
            if type(of: worker) == Worker.self {
                self?.workers.append(worker as! Worker)
            } else if type(of: worker) == Manager.self {
                self?.managers.append(worker as! Manager)
            } else if type(of: worker) == Bookkeeper.self {
                self?.bookkeepers.append(worker as! Bookkeeper)
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
