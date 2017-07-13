//
//  AnotherViewController.swift
//  Employee
//
//  Created by MacStudent on 2017-07-12.
//  Copyright © 2017 MacStudent. All rights reserved.
//


import UIKit
import CoreData
class AnotherViewController: UIViewController
{
    var passedValue:String!
    @IBOutlet weak var lblDetail: UILabel!
    
    @IBOutlet weak var Salary: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks: [Employee] = []
    
    @IBOutlet weak var DateOfbirth: UILabel!
    var managedObjectContext = NSManagedObjectContext()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblDetail.text = passedValue
        getData()
        let task = tasks[0]
        
        if let myName = task.sal
        {
            Salary.text = myName
        }
        
        if let myBirth = task.date
        {
            DateOfbirth.text = myBirth
        }
        
    }
    func getData()
    {
        do
        {
            let filteredreq : NSFetchRequest<Employee> = Employee.fetchRequest()
            //this means that the attribute nameOfTask contains something
            filteredreq.predicate = NSPredicate(format: "name == %@", passedValue)
            //the array task of type Task will be populated
            tasks = try context.fetch(filteredreq)
        }
        catch
        {
            print("Fetching Failed")
        }
    }
}


