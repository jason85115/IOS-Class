//
//  ViewController.swift
//  Chapter12_Lab
//
//  Created by UCOM-02 on 2022/11/11.
//

import UIKit

class ViewController: UIViewController {

    let LINK = "https://jsonplaceholder.typicode.com/posts?userId="
    var list = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegates()
    }

    func initDelegates(){
        pickerView.dataSource = self
        pickerView.delegate = self
        tableView.dataSource = self
    }
}


// MARK: - Picker DataSource and Delegates
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getData("\(row+1)")
    }
}


//MARK: - TableView DataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let data = list[indexPath.row]
        
        if #available(iOS 14, *){
            var config = cell.defaultContentConfiguration()
            config.text = data.title
            cell.contentConfiguration = config
        }
        return cell
    }
}


// MARK: - Network and Parse JSON
extension ViewController{
    func getData(_ id: String){
        if let url = URL(string: LINK + id){
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { responseData, response, error in
                if let error = error{
                    print(error)
                }
                
//                print(String(data: responseData!, encoding: .utf8))
                
                if let data = responseData {
                    if let array = try? JSONDecoder().decode([Article].self, from: data){
                        self.list = array
                        
                        //處理非同步的執行緒不能更新ＵＩ，讓它在ＭＡＩＮ跑
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                   
                    }
                }
                print(self.list)
            }.resume()
        }
    }
}





