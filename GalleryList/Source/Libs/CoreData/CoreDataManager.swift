//
//  CoreDataManager.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/19/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK: - Singleton
    static let sharedInstance = CoreDataManager()
    
    private init() {}
    
    // MARK: - Public
    
    func entity(for entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: self.mainContext)!
    }
    
    func fetchedResultsController(entityName: String, keyForSort: String) -> NSFetchedResultsController<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: keyForSort, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest,
                                          managedObjectContext: CoreDataManager.sharedInstance.mainContext,
                                          sectionNameKeyPath: nil,
                                          cacheName: nil)
    }
    
    func fetchRequest(entityName: String, keyForSort: String) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: keyForSort, ascending: true)]
        
        return fetchRequest
    }
    
    // MARK: - Core Data Stack
    
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return urls[urls.count - 1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "GalleryList", withExtension: "momd")
        
        return NSManagedObjectModel(contentsOf: modelURL!)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: url,
                                               options: [NSMigratePersistentStoresAutomaticallyOption : true])
        } catch {
            print("Oops, something went wrong with saved data")
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleManagedObjectContextDidSaveNotification), name: NSNotification.Name.NSManagedObjectContextDidSave, object: managedObjectContext)
        
        return managedObjectContext
    }()
    
    
    lazy var mainContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = managedObjectContext
        return context
    }()
    
    
    @objc func handleManagedObjectContextDidSaveNotification(notification: Notification) {
        DispatchQueue.main.async {
            self.mainContext.mergeChanges(fromContextDidSave: notification)
        }
    }
    
    // MARK: - Core Data Saving
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
