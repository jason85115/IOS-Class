//
//  ViewController.swift
//  Chapter08
//
//  Created by UCOM-02 on 2022/11/10.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // Gesture Delegate 要讓手勢可以同時使用
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // UI
    let imageView = UIImageView(image: UIImage(named: "iphoneWheel"))
    // Data
    var nowImage = "iphoneWheel"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        
        // 宣告點擊手勢辨識器
        let tapper = UITapGestureRecognizer(target: self,  action: #selector(tapHandler(_:)))
        // 增加手勢辨識
        imageView.addGestureRecognizer(tapper)
        // 連點兩下才感應
        tapper.numberOfTapsRequired = 2
        
        // 旋轉辨識
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateHandler(_:)))
        imageView.addGestureRecognizer(rotate)
        
        // Swipe  LongPress  Pinch  滑動和長按和縮放
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftHandler(_:)))
        imageView.addGestureRecognizer(swipeLeft)
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightHandler(_:)))
        imageView.addGestureRecognizer(swipeRight)
        swipeRight.direction = .right
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchHandler(_:)))
        imageView.addGestureRecognizer(pinch)
        
        // 增加 縮放跟旋轉能同時
        pinch.delegate = self
        rotate.delegate = self
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler(_:)))
        imageView.addGestureRecognizer(longPress)
    }
    
    @objc func swipeLeftHandler(_ sender: UISwipeGestureRecognizer){
        switch sender.direction{
        case .left:
            if nowImage == "wiiWheel"{
                nowImage = "iphoneWheel"
                imageView.image = UIImage(named: nowImage)
            }
            break
        default:
            break
        }
    }
    
    @objc func swipeRightHandler(_ sender: UISwipeGestureRecognizer){
        switch sender.direction{
        case .right:
            if nowImage == "iphoneWheel"{
                nowImage = "wiiWheel"
                imageView.image = UIImage(named: nowImage)
            }
            break
        default:
            break
        }
    }
    
    @objc func longPressHandler(_ sender: UILongPressGestureRecognizer){
        switch sender.state{
        case .began:
            print("longPress BEGIN")
            break
        case .possible:
            print("longPress possible")
            break
        case .changed:
            print("longPress changed")
            break
        case .ended:
            print("longPress ended")
            break
        case .cancelled:
            print("longPress cancelled")
            break
        case .failed:
            print("longPress failed")
            break
        @unknown default:
            print("longPress default")
            break
        }
    }

    @objc func tapHandler(_ sender: UITapGestureRecognizer){
        print("Tapping...")
        UIView.animate(withDuration: 0.5) {
            let r = CGFloat.random(in: 0...1)
            let g = CGFloat.random(in: 0...1)
            let b = CGFloat.random(in: 0...1)
            self.view.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        } completion: { flag in
            
        }

    }
    
    @objc func rotateHandler(_ sender: UIRotationGestureRecognizer){
        if let transform = sender.view?.transform{
            sender.view?.transform = transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
    
    @objc func pinchHandler(_ sender: UIPinchGestureRecognizer){
        if let transform = sender.view?.transform{
            sender.view?.transform = transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
        
}
