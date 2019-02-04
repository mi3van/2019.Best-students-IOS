//
//  DataHelper.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 30/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit
import CoreData

class DataHelper {
    static func saveDataStudent(name: String, surname: String, assessment: Int) ->
        Bool {
            var isSuccess: Bool = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            
            let entityDescription =
                NSEntityDescription.entity(forEntityName: AppCommonKeys.STUDENTS_MODEL_KEY,
                                           in: context)
            
            let student = StudentsMO(entity: entityDescription!,
                                     insertInto: context)
            
            student.name = name
            student.surname = surname
            student.assessment = Int16(assessment)
            
            do {
                try context.save()
            } catch _ as NSError {
                isSuccess = false
            }
            
            return isSuccess
    }
    
    static func loadDataStudents() -> [StudentsMO]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: AppCommonKeys.STUDENTS_MODEL_KEY)
        do {
            let students = try context.fetch(employeesFetch) as! [StudentsMO]
            return students
        } catch {
            return nil
        }
    }
    
    static func deleteStudent(student: StudentsMO) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        context.delete(student)
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    static func updateStudent(student: StudentsMO, positionStud: Int) -> Bool {
        var isSuccess = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: AppCommonKeys.STUDENTS_MODEL_KEY)
        
        
        do {
            let loadedStudents = try context.fetch(employeesFetch) as! [StudentsMO]
            var savedStudent = loadedStudents[positionStud]
            savedStudent = student
            
            try context.save()
        } catch {
            isSuccess = false
        }
        return isSuccess
    }
}
