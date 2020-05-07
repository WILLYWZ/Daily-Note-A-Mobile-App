//
//  TableViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit
import CoreData

class CoreDataTool: NSObject {

    class func fearchAllMotion() -> [Motion] {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Motion>(entityName:"Motion")
        let sort = NSSortDescriptor.init(key: "time", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            return fetchedObjects
        }
        catch {
            fatalError("error：\(error)")
        }
    }
    
    class func saveMotion(time:String,category:String,moment:String,emotion:String) -> Void {
        let app:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let student = NSEntityDescription.insertNewObject(forEntityName: "Motion", into: context) as! Motion
        student.time = time
        student.category = category
        student.moment = moment
        student.emotion = emotion
        do {
            try context.save()
        } catch {
            fatalError("save error：\(error)")
        }
    }
    
    class func fearchMotions(emotion:String) -> [Motion] {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Motion>(entityName:"Motion")
        do {
            var tmpMotion:[Motion] = [Motion]()
            let fetchedObjects:[Motion] = try context.fetch(fetchRequest)
            for (_,value) in fetchedObjects.enumerated() {
                if (value.emotion == emotion) {
                    tmpMotion.append(value)
                }
            }
            return tmpMotion
        }
        catch {
            fatalError("error：\(error)")
        }
    }
    
    class func deleteAllMotion() -> Void {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Motion>(entityName:"Motion")
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            for one: Motion in fetchedObjects {
                context.delete(one)
            }
            app.saveContext()
        }
        catch {
            fatalError("error：\(error)")
        }
    }
    
}
