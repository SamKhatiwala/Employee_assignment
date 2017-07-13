//
//  AddTaskViewController.swift
//  Employee
//
//  Created by MacStudent on 2017-07-12.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var MySalary: UITextField!
    @IBOutlet weak var SelectedDate: UILabel!
    @IBOutlet weak var MyDatePicker: UIDatePicker!
    @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func MyDateAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: MyDatePicker.date)
        self.SelectedDate.text = strDate
        
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        SelectedDate.text = dateFormatter.string(from: sender.date)
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Employee(context: context)
        task.name = taskTextField.text!
        task.sal = MySalary.text!
        task.date = SelectedDate.text!
        // Save the data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
    }
    
}

