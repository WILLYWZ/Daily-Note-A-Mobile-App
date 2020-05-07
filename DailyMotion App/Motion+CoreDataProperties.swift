//
//  TableViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import Foundation
import CoreData


extension Motion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Motion> {
        return NSFetchRequest<Motion>(entityName: "Motion")
    }

    @NSManaged public var time: String?
    @NSManaged public var category: String?
    @NSManaged public var moment: String?
    @NSManaged public var emotion: String?

}
