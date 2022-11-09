//
//  ViewController.swift
//  Chapter03_06_segmented_webview
//
//  Created by UCOM-02 on 2022/11/8.
//

import UIKit

class ViewController: UIViewController {

    // UI
    @IBAction func siteChooserHandler(_ sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        let link = links[idx]
        if let url = URL(string: link){
            webViewer.loadRequest(URLRequest(url: url))
        }
    }
    
    @IBOutlet weak var webViewer: UIWebView!
    
    // Data
    let links = ["https://www.uuu.com.tw", "https://www.facebook.com", "https://www.google.com.tw"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

