//
//  ViewController.swift
//  Chapter04
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {
    
    let NUMS = 50
    let MARGIN: CGFloat = 50.0
    override func viewDidLoad() {
        super.viewDidLoad()
//        buttonDemo();
        setImages()
    }
    
    func setImages(){
        let screenSize = self.view.frame.size
        for _ in 1...NUMS{
            let imgView = MyImageView(image: UIImage(named: "smile"))
            imgView.isUserInteractionEnabled = true
            let rx = CGFloat.random(in: MARGIN...screenSize.width-MARGIN)
            let ry = CGFloat.random(in: MARGIN...screenSize.height-MARGIN)
            self.view.addSubview(imgView)
            imgView.center = CGPoint(x:rx, y:ry)
        }
    }
    
    func buttonDemo(){
        let screenSize = self.view.frame.size
        print("\(screenSize.width), \(screenSize.height)")

        let btn = UIButton(type: .close)
        btn.frame = CGRect(x: 100, y: 100, width: screenSize.width/3, height: screenSize.height/10)
        btn.setTitle("click me", for: .normal)
        btn.setTitle("don't click me", for: .highlighted)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.darkGray
        btn.center = self.view.center
        self.view.addSubview(btn)
        
    }


}

