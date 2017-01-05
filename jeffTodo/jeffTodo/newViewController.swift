//
//  newViewController.swift
//  jeffTodo
//
//  Created by Devteam on 11/2/16.
//  Copyright © 2016 KaayLabs. All rights reserved.
//

import UIKit
import CoreData

struct cellData {
    //let cell : Int!
    let id : Int64!
    let name : String!
    let exp : Int64!
    let imagee : UIImage!
}

class newViewController: UITableViewController {
 
    var arrayOfData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        do{            
            
         let employee = try DataContoller.getContext().fetch(Employee.fetchRequest())
            for emp in employee {
                let ele = cellData( id : (emp as! Employee).id, name : (emp as! Employee).name, exp : Int64((emp as! Employee).experience), imagee : #imageLiteral(resourceName: "Cross") ) as cellData
                arrayOfData.append(ele)
            }
            for ee in arrayOfData{
                print(ee)
            }
                
        }
        catch{
            print("\(error)")
        }
        /*arrayOfData = [cellData( id : 1, name : "jeff", exp : 1, imagee : #imageLiteral(resourceName: "Cross"))]
        print(")))))>>>> view didload")*/
    }
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrayOfData.count
      
    }
    
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = Bundle.main.loadNibNamed("tableView", owner: self, options: nil)?.first as! tableView
        
        cell.labelId.text = String(arrayOfData[indexPath.row].id)
        cell.labelName.text = arrayOfData[indexPath.row].name
        cell.labelExp.text = String(arrayOfData[indexPath.row].exp)
        print(")))))>>>>")
        print("+++>>>Image \(arrayOfData[indexPath.row].imagee)")
        cell.imageVew.image = arrayOfData[indexPath.row].imagee
        return cell
    }
}
