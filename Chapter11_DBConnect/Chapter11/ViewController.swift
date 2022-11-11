//
//  ViewController.swift
//  Chapter11
//
//  Created by UCOM-02 on 2022/11/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dao = RestaurantDAO.shared
        
        print(dao.getAll())
    }


}

