//
//  ViewController.swift
//  Chapter12_Network_APIandJson
//
//  Created by UCOM-02 on 2022/11/11.
//

import UIKit

class ViewController: UIViewController {
    
    // API Host
    let HOST = "https://jsonplaceholder.typicode.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getRemoteContentByString()
//        getData_GET_Dictionary(id: 3)
//        getData_GET_List()
        getData_POST(title:"foo",body:"bar",userId:1)
    }
    
    func getData_GET_List(){
        let getUrl = "posts/"
        let fullUrl = HOST + getUrl
        
        if let url = URL(string: fullUrl){
            let req = URLRequest(url: url)
            URLSession.shared.dataTask(with: req) { data, res, error in
                if let error = error{
                    print("ERROR1: \(error)")
                    return
                }
                
                if let data = data{
                    self.parseJsonStringToObject(data: data)
                }
            }.resume()
        }
    }
    
    
    func getData_GET_Dictionary(id: Int){
        let getUrl = "posts/\(id)"
        let fullUrl = HOST + getUrl
        
        if let url = URL(string: fullUrl){
            let req = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: req) { data, res, error in
                if let error = error{
                    print("ERROR1: \(error)")
                    return
                }
                
                if let data = data{
                    self.parseJsonStringToObject(data: data)
                }
            }.resume()
        }
    }
    
    
    func getData_POST(title: String, body: String, userId: Int){
        let postUrl = "posts/"
        let fullUrl = HOST + postUrl
        var bodyDict = [String:Any]()
        bodyDict["title"] = title
        bodyDict["body"] = body
        bodyDict["userId"] = userId
        
        if let url = URL(string: fullUrl){
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            req.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
            req.httpBody = try? JSONSerialization.data(withJSONObject: bodyDict)
            
            URLSession.shared.dataTask(with: req) { data, res, error in
                if let error = error{
                    print("ERROR1: \(error)")
                    return
                }
                if let data = data{
                    self.parseJsonStringToObject(data: data)
                }
            }.resume()
        }
    }
    
    func parseJsonStringToObject(data: Data){
        if let dict = try? JSONSerialization.jsonObject(with: data){
            print(dict)
        }
    }
    
    func getRemoteContentByString(){
        if let url = URL(string: "https://www.uuu.com.tw"), let data = try? String(contentsOf: url){
            print(data)
        }
    }


}

