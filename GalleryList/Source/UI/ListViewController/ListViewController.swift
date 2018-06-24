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
        get {
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

        
        set(someWorkers) {
            switch index {
            case 0:
                self.managers = someWorkers as! [Manager]
            case 1:
                self.workers = someWorkers as! [Worker]
            case 2:
                self.bookkeepers = someWorkers as! [Bookkeeper]
            default:
                print("default")
            }
        }
    }
}

class ListViewController: UIViewController {

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
        let controller = ItemViewController()
        
        controller.completionHandler = { [weak self] someWorker in
            self?.saveSomeWorker(someWorker: someWorker)
            self?.rootView.tableView.reloadData()
            
            controller.dismiss(animated: true, completion: nil)
        }
        
        let navigationVC = UINavigationController(rootViewController: controller)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @objc private func makeEditing() {
        self.rootView.tableView.isEditing = !self.rootView.tableView.isEditing
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

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.staff[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.staff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListTableViewCell = cast(tableView.dequeueReusableCell(withIdentifier: toString(ListTableViewCell.self), for: indexPath))!
        let photo = UIImage(named: "list_icon")
        cell.fill(with: self.staff[indexPath.section][indexPath.row], photo: photo!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ItemViewController()
        controller.model = self.staff[indexPath.section][indexPath.row]
        
        controller.completionHandler = { [weak self] someWorker in
            self?.staff[indexPath.section].remove(at: indexPath.row)
            self?.saveSomeWorker(someWorker: someWorker)
            self?.rootView.tableView.reloadData()
            
            controller.dismiss(animated: true, completion: nil)
        }
        
        let navigationVC = UINavigationController(rootViewController: controller)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headerTitles[section]
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.staff[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.staff[sourceIndexPath.section][sourceIndexPath.row]
        self.staff[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        self.staff[destinationIndexPath.section].insert(movedObject, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.rootView.tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            var row = 0
            if sourceIndexPath.section < proposedDestinationIndexPath.section {
                row = tableView.numberOfRows(inSection: sourceIndexPath.section) - 1
            }
            
            return IndexPath(row: row, section: sourceIndexPath.section)
        }
        
        return proposedDestinationIndexPath;
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
