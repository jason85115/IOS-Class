//
//  ViewController.swift
//  Chapter09
//
//  Created by UCOM-02 on 2022/11/10.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // UI
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detect: UIImageView!
    @IBOutlet weak var mapButton: UIBarButtonItem!
    // Data
    var locationMgr: CLLocationManager!
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initData()
        initSubview()
        initDelegate()
    }
    
    func initDelegate(){
        locationMgr.delegate = self
    }
    
    func initSubview(){
        mapButton.isEnabled = false
        detect.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(detectHandler(_:)))
        
        detect.addGestureRecognizer(tap)
    }
    
    func initData(){
        locationMgr = CLLocationManager()
        locationMgr.requestAlwaysAuthorization()
    }
    
    @objc func detectHandler(_ sender: UITapGestureRecognizer){
        mapButton.isEnabled = false
        locationMgr.startUpdatingLocation()
        self.detect.backgroundColor = UIColor.lightGray
        UIView.animate(withDuration: 0.5) {
            self.detect.backgroundColor = UIColor.white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let next = segue.destination as? MapViewController{
            next.clLocation = currentLocation
        }
    }
    
}

// MARK: - LocationManager Delegate
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations...")
        currentLocation = locations[0]
        locationLabel.text = "\(currentLocation.coordinate.longitude),\(currentLocation.coordinate.latitude)"
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(currentLocation) { placeMark, error in
            if let error = error{
                print (error)
                return
            }
            
            if let pm = placeMark?[0]{
                self.addressLabel.text = "[\(pm.postalCode ?? "P") \(pm.subAdministrativeArea ?? "sa") \(pm.locality ?? "L") \(pm.thoroughfare ?? "T") \(pm.subThoroughfare ?? "ST")"
            }
        }
        mapButton.isEnabled = true
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


// 25.098129542462683, 121.55078491258517

