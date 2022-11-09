//
//  MyImageView.swift
//  Chapter04
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class MyImageView: UIImageView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var begin: Bool = false
    var startLocation: CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Began...")
        begin = true
        self.image = UIImage(named: "ironman")
        self.superview!.bringSubviewToFront(self)
        
        startLocation = touches.first!.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Moved...")
        if begin{
            let touchLocation = touches.first!.location(in: self)
            let dx = touchLocation.x - startLocation.x
            let dy = touchLocation.y - startLocation.y
            let newCenter = CGPoint(x:self.center.x+dx, y:self.center.y+dy)
            if newCenter.x >= self.superview!.frame.size.width || newCenter.x <= 0{
                
            }else{
                self.center = newCenter
            }
                    
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Canceled")
        begin=false
        image = UIImage(named: "smile")

    }
}
