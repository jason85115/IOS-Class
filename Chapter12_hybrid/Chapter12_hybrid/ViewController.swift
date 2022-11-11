//
//  ViewController.swift
//  Chapter12_hybrid
//
//  Created by UCOM-02 on 2022/11/11.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        initDelegates()
    }
    
    func initSubviews(){
        if let local = Bundle.main.path(forResource: "home", ofType: "html"){
            webView.load(URLRequest(url: URL(filePath: local)))
        }
    }
    
    func initDelegates(){
        webView.navigationDelegate = self
    }


    @IBAction func handler(_ sender: UIBarButtonItem) {
        webView.evaluateJavaScript("showItem('overview\(sender.tag)')")
    }
}

// MARK: - WKWebView Navigation Delegate
extension ViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlString = navigationAction.request.url?.absoluteString, urlString.contains("app:"){
            let array = urlString.split(separator: ":")
            
            if array.count == 2, let cmd = array[1].removingPercentEncoding, cmd == "Mail"{
                let con = UIImagePickerController()
                con.sourceType = .photoLibrary
                present(con, animated: true)
            }
            decisionHandler(.cancel)
            return
        }
        
        decisionHandler(.allow)
    }
}
