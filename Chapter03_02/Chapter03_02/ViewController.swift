//
//  ViewController.swift
//  Chapter03_02
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        let actionSheetController = UIAlertController(title: "Action Sheet", message: "Choose one options", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        actionSheetController.addAction(okAction)
        actionSheetController.addAction(cancelAction)
        
        present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func showAlertView(_ sender: UIButton) {
        let actionSheetController = UIAlertController(title: "Alert View", message: "Choose one options", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        actionSheetController.addAction(okAction)
        actionSheetController.addAction(cancelAction)
        
        present(actionSheetController, animated: true, completion: nil)
    }
}

