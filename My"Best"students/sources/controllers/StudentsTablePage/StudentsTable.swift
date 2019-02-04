//
//  ViewController.swift
//  My"Best"students
//
//  Created by Ivan Kuzmin on 23/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//
import UIKit

class StudentsTable: UITableViewController {
    var students: [StudentsMO]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initTable()
    }
    
    private func initTable() {
        let data: [StudentsMO]? = DataHelper.loadDataStudents() ?? nil
        if data != nil {
            students = data!
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = indexPath.row
        let storyboard = UIStoryboard(name: "StudentItem", bundle: nil)
        let itemPage = storyboard.instantiateViewController(withIdentifier: "StudentItemPage") as! StudentItemPage
        itemPage.positionStudentInArray = position
        itemPage.studentForEdit = students[position]
        navigationController?.pushViewController(itemPage, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataHelper.deleteStudent(student: students[indexPath.row])
            self.initTable()
        }
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
