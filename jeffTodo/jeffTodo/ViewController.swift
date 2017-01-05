//
//  ViewController.swift
//  jeffTodo
//
//  Created by Devteam on 11/2/16.
//  Copyright © 2016 KaayLabs. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var employee : [Employee] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let emp = employee[indexPath.row]
        
        cell.textLabel?.text = " \(emp.id)   \(emp.name!) "
        cell.detailTextLabel?.text = " \(emp.experience) "
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        LoadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("Indexpath\(indexPath.row)")
        if editingStyle == .delete{
            let emp = employee[indexPath.row]
            DataContoller.getContext().delete(emp)
            DataContoller.saveContext()
            LoadData()
        }
        
    }
    func LoadData(){
        do{
        
            employee = try DataContoller.getContext().fetch(Employee.fetchRequest())
            
            
            tableView.reloadData()
        }
        catch{
            print("\(error)")
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row \(indexPath.row)")
        do{
            let emp = employee[indexPath.row] as NSManagedObject
            emp.setValue("jeff00", forKey: "name")
            try DataContoller.getContext().save()
        } catch{ print(error) }
        tableView.reloadData()
    }

}

