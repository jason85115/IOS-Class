//
//  ViewController.swift
//  Chapter07
//
//  Created by UCOM-02 on 2022/11/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func Handler(_ sender: Any) {
        let title = getValue(key: "ALERT_TITLE_WELCOMEW")
        let ok = getValue(key: "ALERT_BTN_OK")
        
        let sayHello = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: ok, style: .default)
        
        sayHello.addAction(okAction)
        
        present(sayHello, animated: true)
        
    }
    
    func getValue(key: String) -> String{
        NSLocalizedString(key, tableName: "MyRes", bundle: Bundle.main, value: "", comment: "")
    }
}

