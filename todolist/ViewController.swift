//
//  ViewController.swift
//  todolist
//
//  Created by Amelie Baimukanova on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskName = textfield.text!
        var newTask = TaskItem()
        
        
        newTask.name = taskName
        
        do {
            if let data = defaults.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                defaults.set(encodedata, forKey: "taskItemArray")
            } else {
                let encodedata = try JSONEncoder().encode([newTask])
                defaults.set(encodedata, forKey: "taskItemArray")
            }
        } catch {
            print("unable to encode \(error)")
        }
        
        
        
        
        
        
        
        
        
//        if let array = defaults.array(forKey: "taskItemArray") {
//            taskArray = array as! [TaskItem]
//            taskArray.append(newTask)
//            defaults.set(taskArray, forKey: "taskItemArray")
//        } else {
//            let array = [newTask]
//            defaults.set(taskArray, forKey: "taskItemArray")
//        }
        
//        var taskarray: [String] = []
//
//            if let array = defaults.array(forKey: "taskArray") {
//                taskarray = array as! [String]
//                taskarray.append(taskName)
//                defaults.set(taskarray, forKey: "taskArray")
//            } else {
//                let array = [taskName]
//
//                defaults.set(array, forKey: "taskArray")
//            }
        textfield.text = ""
        
    }
    
}

