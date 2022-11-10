//
//  ViewController.swift
//  Chapter08_drawer
//
//  Created by UCOM-02 on 2022/11/10.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func drawerHandler(_ sender: UIBarButtonItem) {
        if let frame = self.navigationController?.view.frame {
            let originPoint = CGPoint(x: 0, y: 0)
            let originRect = CGRect(origin: originPoint, size: frame.size)
            
            let moveDRAWERX = frame.size.width * DRAWER_WIDTH
            let modifyPoint = CGPoint(x: moveDRAWERX, y: 0)
            let modifyRect = CGRect(origin: modifyPoint, size: frame.size)
            
            UIView.animate(withDuration: 0.5) {
                if frame.minX != 0{
                    self.navigationController?.view.frame = originRect
                }else{
                    self.navigationController?.view.frame = modifyRect
                }
            }
        }
    }
    
    
    // Data
    let DRAWER_WIDTH = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let drawerView = self.storyboard?.instantiateViewController(withIdentifier: "drawer"){
            
            drawerView.view.frame = CGRect(x:0.0, y:0.0, width: (self.navigationController?.view.frame.width ?? 120) * DRAWER_WIDTH, height: self.navigationController?.view.frame.height ?? 0  )
            
            UIApplication.shared.keyWindow?.insertSubview(drawerView.view, at: 0)
        }
    }

    
}

