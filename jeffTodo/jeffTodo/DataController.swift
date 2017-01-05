//
//  DataController.swift
//  jeffTodo
//
//  Created by Devteam on 11/2/16.
//  Copyright © 2016 KaayLabs. All rights reserved.
//

import Foundation
import CoreData


class DataContoller{
    private init(){
        
    }
    
    class func getContext() ->NSManagedObjectContext{
        return self.persistentContainer.viewContext
    }
  static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "jeffTodo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
   class func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    

}
