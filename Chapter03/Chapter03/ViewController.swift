//
//  ViewController.swift
//  Chapter03
//
//  Created by UCOM-02 on 2022/11/7.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lightBulbOn: UIImageView!
    @IBOutlet weak var sliderLightness: UISlider!
    @IBOutlet weak var switchLight: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLightness.value = 0
        lightBulbOn.isHidden = true
    }
    
    
    @IBAction func alphaChangeHandler(_ sender: UISlider) {
        lightBulbOn.alpha = CGFloat(sender.value)
    }
    
    @IBAction func powerHandler(_ sender: UISwitch) {
        lightBulbOn.isHidden = !sender.isOn
        if sender.isOn{
            lightBulbOn.alpha = CGFloat(0.5)
            sliderLightness.value = 0.5
        }else{
            lightBulbOn.alpha = CGFloat(0)
            sliderLightness.value = 0
        }
        sliderLightness.isEnabled = sender.isOn
        sliderLightness.setNeedsDisplay()
    }
    
}

