//
//  ViewController.swift
//  Chapter12_WKWebView
//
//  Created by UCOM-02 on 2022/11/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//            showPDF()
            showWEB()
    }
    
    func showPDF(){
        if let local = Bundle.main.path(forResource: "Note_Day5", ofType: "pdf"){
            let url = URL(filePath: local)
            webView.load(URLRequest(url: url))
        }
    }
    
    func showWEB(){
        let url = URL(string: "https://www.uuu.com.tw")!
        webView.load(URLRequest(url: url))
    }


}

