//
//  ViewController.swift
//  Chapter06_Modal
//
//  Created by UCOM-02 on 2022/11/9.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func codeHandler(_ sender: Any) {
        // Version 1
//        if let modal = self.storyboard?.instantiateViewController(identifier: "modal"){
//            modal.modalTransitionStyle = .coverVertical
//            modal.modalPresentationStyle = .automatic
//
//            present(modal, animated: true)
//        }
        // Version 2
        performSegue(withIdentifier: "modal", sender: sender)
            
    }
    @IBAction func xibHandler(_ sender: Any) {
        let modal = XibViewController()
        modal.modalTransitionStyle = .coverVertical
        modal.modalPresentationStyle = .automatic

        present(modal, animated: true)
              
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

