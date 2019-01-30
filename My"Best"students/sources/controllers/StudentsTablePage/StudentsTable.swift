//
//  ViewController.swift
//  My"Best"students
//
//  Created by Ivan Kuzmin on 23/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//
import UIKit

class StudentsTable: UITableViewController {
    var students: [ModelStudent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTable()
    }
    
    private func initTable() {
        var student = ModelStudent()
        student.name = "Bill"
        student.surname = "Evans"
        student.assessment = 4
        students.append(student)
        
        student = ModelStudent()
        student.name = "Oscar"
        student.surname = "Peterson"
        student.assessment = 5
        students.append(student)
        
        student = ModelStudent()
        student.name = "Dave"
        student.surname = "Brubeck"
        student.assessment = 3
        students.append(student)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "StudentCell")
        
        let student = (students)[indexPath.row]
        cell?.textLabel?.text = ("\(student.name) \(student.surname)")
        cell?.detailTextLabel?.text = String(student.assessment)
        let customColorView = UIView()
        customColorView.backgroundColor = UIColor(red: 0 / 255.0, green: 144 / 255.0, blue: 85 / 255.0, alpha: 0.5)
        cell?.selectedBackgroundView = customColorView;
        
        return cell!
    }
}
