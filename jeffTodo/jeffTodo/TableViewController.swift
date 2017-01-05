//
//  TableViewController.swift
//  jeffTodo
//
//  Created by Devteam on 11/2/16.
//  Copyright © 2016 KaayLabs. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UIViewController {
 

    @IBOutlet weak var textLabel: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textExp: UITextField!
    var id : Int64 = 0
    var name : String = ""
    var exp : Int64 = 0
    let context = DataContoller.getContext()
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    
    override func viewWillAppear(_ animated: Bool) {
        getMax()
    }
    @IBAction func SaveClick(_ sender: AnyObject) {
        
        if !(textName.text?.isEmpty)!{
            name = String(textName.text!)
         
            if !(textExp.text?.isEmpty)!{
                exp = Int64(textExp.text!)!
                
                let employee = Employee(context : context)
                employee.id = id
                employee.name = name
                employee.experience = exp
                DataContoller.saveContext()
            getMax()
            textName.text = ""
            textExp.text = ""
               // let vc = storyboard?.instantiateViewController(withIdentifier: "storyBo") as! ViewController
                self.navigationController?.popViewController(animated: true)
            }
            else{
                
                let alert = UIAlertController(title: "Error",  message: "Experience cannot be nil", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    func getMax(){
        do{
            let fetch = NSFetchRequest<Employee>( entityName : "Employee")
            fetch.fetchLimit = 1
            fetch.sortDescriptors = [NSSortDescriptor(key : "id", ascending : false)]
            let res = try context.fetch(fetch)
            
            if res.count > 0{
                id = Int64(res[0].id) + 1
            }
            
            textLabel.text = String(id)
        }
        catch{
            print("Could not fetch Result")
        }

    }
    
}
