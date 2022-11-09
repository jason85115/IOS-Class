//
//  ViewController.swift
//  Chapter03_04
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: UI Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    //MARK: Data
    var list: [String]!
    //MARK: Constructor
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initSubviews()
        initDelegates()
    }
    //MARK: Init Functions
    func initData(){
        list = ["Apple", "Bananas", "Carrot", "Grapes", "Pear"]
    }
    
    func initSubviews(){
        
    }
    
    func initDelegates(){
        pickerView.dataSource = self
        pickerView.delegate = self 
    }


}
//MARK: - PickerView DataSource
extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
}

//MARK: - PickerView Delegate
extension ViewController:UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = UIImage(named: list[row].lowercased())
    }
}

