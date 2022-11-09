//
//  ViewController.swift
//  Chapter03_05_PickerView_Advanced
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {
    
    // UI
    @IBOutlet weak var distLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    // Data
    let config = [(key:"1", count:5), (key:"2", count:4)]
    var data: [String:[String]]!
    var cities: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initSubviews()
        initDelegates()
    }
    
    func initData(){
        data = [String:[String]]()
        for (key,count) in config{
            var tmpList = [String]()
            for i in 1...count{
                tmpList.append("Dist\(key)\(i)")
            }
            data["City\(key)"] = tmpList
        }
        
        cities = data.keys.sorted()
    }
    
    func initSubviews(){
        cityLabel.text = cities[0]
        let dists = data[cities[0]] ?? [""]
        distLabel.text = dists[0]
    }
    
    func initDelegates(){
        pickerView.dataSource = self
        pickerView.delegate = self
    }
}

//MARK: - PickerView DataSource
extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return cities.count
        }else{
            let idx = pickerView.selectedRow(inComponent: 0)
            let city = cities[idx]
            if let array = data[city]{
                return array.count
            }else{
                return 0
            }
        }
    }
}

//MARK: - PickerView Delegate
extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return cities[row]
        }else{
            let idx = pickerView.selectedRow(inComponent: 0)
            let city = cities[idx]
            if let array = data[city]{
                return array[row]
            }else{
                return ""
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
            let city = cities[row]
            cityLabel.text = city
            let dist = data[city] ?? [""]
            distLabel.text = dist[0]
        }else{
            let idx = pickerView.selectedRow(inComponent: 0)
            let city = cities[idx]
            let dist = data[city] ?? [""]
            distLabel.text = dist[row]
        }
    }
}
