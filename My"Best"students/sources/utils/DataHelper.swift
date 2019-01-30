//
//  DataHelper.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 30/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class DataHelper {
    static func saveData(filename: String, sData: AnyObject) -> Bool {
        let fullPath = getDocumentsDirectory().appendingPathComponent(filename)
        var isSuccess: Bool = false
        if #available(iOS 11.0, *) {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: sData, requiringSecureCoding: false) as AnyObject
                try data.write(to: fullPath)
                isSuccess = true
            } catch {
                print("Failed save data")
            }
        } else {
            let pathString = fullPath.appendingPathComponent("Data").path
            isSuccess = NSKeyedArchiver.archiveRootObject(saveData, toFile: pathString)
        }
        return isSuccess
    }
    
    static func loadData(with filename: String) -> AnyObject? {
        let fullPath = getDocumentsDirectory().appendingPathComponent(filename)
        let pathString = fullPath.appendingPathComponent("Data").path
        if let nsData = NSData(contentsOfFile: pathString) {
            do {
                let data = Data(referencing:nsData)
                let possibleObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                return possibleObject as AnyObject
            } catch {
                print("Couldn't read file.")
            }
        }
        return nil
    }
    
    static private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
