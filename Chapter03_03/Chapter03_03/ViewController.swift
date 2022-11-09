//
//  ViewController.swift
//  Chapter03_03
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {

    var taiwanFormat: Bool = true
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var showDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        showDateString(date: Date(), taiwan: taiwanFormat)
        
        datePicker.maximumDate = Date()
    }
    
    func showDateString(date: Date, taiwan: Bool){
        if taiwan{
            showDate.text = getDateString(date: date, taiwan: taiwanFormat)
        }else{
            showDate.text = getDateString(date: date, taiwan: taiwanFormat)
        }
    }
    
    func getDateString(date: Date, taiwan: Bool) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        if taiwan{
            formatter.calendar = Calendar(identifier: .republicOfChina)
        }
        return formatter.string(from: date)
    }

    @IBAction func datePickerHandler(_ sender: UIDatePicker) {
        showDateString(date: sender.date, taiwan: true)
    }
    
    @IBAction func changeDateFormat(_ sender: UISwitch) {
        
        if sender.isOn{
            taiwanFormat = true
        }else{
            taiwanFormat = false
        }
        
        showDateString(date: datePicker.date, taiwan: taiwanFormat)
    }
}

