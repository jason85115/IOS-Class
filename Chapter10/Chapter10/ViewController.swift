//
//  ViewController.swift
//  Chapter10
//
//  Created by UCOM-02 on 2022/11/10.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func photoChooserHandler(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @IBAction func Camera(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true)
    }
    
    // UI
    @IBOutlet weak var photoView: UIImageView!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        // Do any additional setup after loading the view.
    }

    func initSubviews(){
        // UIImagePickerController.isSourceTypeAvailable(.camera) also can use at here
        if !UIImagePickerController.isCameraDeviceAvailable(.rear){
            self.navigationItem.leftBarButtonItem = nil
        }
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
}

// MARK - ImagePicker Delegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage{
            photoView.image = image
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
}



// 更多可參考 https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/ios-14-%E6%8F%90%E4%BE%9B%E5%A4%9A%E9%81%B8%E7%85%A7%E7%89%87%E5%8A%9F%E8%83%BD%E7%9A%84-phpickerviewcontroller-d9733d203222
