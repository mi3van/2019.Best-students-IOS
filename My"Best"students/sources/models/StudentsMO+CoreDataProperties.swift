//
//  StudentsMO+CoreDataProperties.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 03/02/2019.
//  Copyright © 2019 Example. All rights reserved.
//
//

import Foundation
import CoreData


extension StudentsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentsMO> {
        return NSFetchRequest<StudentsMO>(entityName: "Students")
    }

    @NSManaged public var assessment: Int16
    @NSManaged public var name: String
    @NSManaged public var surname: String

}
