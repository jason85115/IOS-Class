//
//  MapViewController.swift
//  Chapter09
//
//  Created by UCOM-02 on 2022/11/10.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    // UI
    @IBOutlet weak var map: MKMapView!
    
    // Data
    var clLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: clLocation.coordinate, span: span)
        map.region = region
        
        showAnnotation()
        // Do any additional setup after loading the view.
    }
    
    func showAnnotation(){
        let annotation = MKPointAnnotation()
        annotation.coordinate = clLocation.coordinate
        annotation.title = "青青草原"
        annotation.subtitle = "婚宴會館"
        
        map.addAnnotation(annotation)
    }
}


extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")
        
        if view == nil{
            view = MKAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        }
        
        view?.annotation = annotation
        view?.canShowCallout = true
        view?.image = UIImage(named: "pin")
        
        let mobile = UIButton(type: .custom)
        mobile.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        mobile.setImage(UIImage(named: "mobile"), for: .normal)
        mobile.tag = 1
        view?.rightCalloutAccessoryView = mobile
        
        let web = UIButton(type: .custom)
        web.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        web.setImage(UIImage(named: "web"), for: .normal)
        web.tag = 0
        view?.leftCalloutAccessoryView = web
        
        return view
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let links = ["https://www.uuu.com.tw", "tel://0225149191"]
        if let url = URL(string: links[control.tag]){
            UIApplication.shared.open(url)
        }
    }
    
}
