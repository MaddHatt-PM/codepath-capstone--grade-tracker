//
//  Persistence.swift
//  GradeTracker
//
//  Created by Patt Martin on 11/5/23.
//

import CoreData

struct DatabaseStore {
  static let shared = DatabaseStore()
  let container: NSPersistentCloudKitContainer

  static var preview: DatabaseStore = {
    let result = DatabaseStore(inMemory: true)

    return result
  }()

  init(inMemory: Bool = false) {
    container = NSPersistentCloudKitContainer(name: "GradeTracker")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate.
        // You should not use this function in a shipping application, although it may be useful during development.

        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }

  static func saveDatabase(context: NSManagedObjectContext) {
    do {
      try context.save()
    } catch let err as NSError {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate.
      // You should not use this function in a shipping application, although it may be useful during development.
      fatalError("Unresolved error \(err), \(err.userInfo)")
    }
  }

  func resetDatabase(context: NSManagedObjectContext) {
    let storeCoordinator = container.persistentStoreCoordinator
    do {
      for store in storeCoordinator.persistentStores {
        try storeCoordinator.destroyPersistentStore(at: store.url!, ofType: store.type, options: nil)
      }
    } catch let err as NSError {
      print("Error occured resetting database: \(err)")
    }
  }
}
