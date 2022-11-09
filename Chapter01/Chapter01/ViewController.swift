//
//  ViewController.swift
//  Chapter01
//
//  Created by UCOM-02 on 2022/11/7.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func buttonHandler(_ sender: Any, forEvent event: UIEvent) {
        let text = textField.text ?? ""
        showLabel.text = "Hello \(text)"
        textField.resignFirstResponder()
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLabel.text = ""
        textField.delegate = self
    }


}

