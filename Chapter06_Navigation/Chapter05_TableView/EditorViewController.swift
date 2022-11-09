//
//  EditorViewController.swift
//  Chapter06_Navgation
//
//  Created by UCOM-02 on 2022/11/9.
//

import UIKit

class EditorViewController: UIViewController {

    // UI
    @IBOutlet weak var taskInput: UITextField!
    // Data
    var newOrEdit: String! = "New"
    var filePath: String! = ""
    var idx: Int! = -1
    var toDoList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = newOrEdit
        toDoList = [String]()
        toDoList = NSArray(contentsOfFile: filePath) as? [String]
        
        if idx != -1{
            taskInput.text = toDoList[idx]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveHandler(_ sender: Any) {
        // Collect User Input
        let newtext = taskInput.text ?? ""
        
        if idx == -1{
            toDoList.append(newtext)
        }else{
            toDoList[idx] = newtext
        }
        
        (toDoList as NSArray).write(toFile: filePath, atomically: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
