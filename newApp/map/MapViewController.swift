//
//  MapViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 21.10.2021.
//

import Foundation
import UIKit
import MapKit
import SDWebImage

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var marker = MarkerList().markers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.placePins()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
        
    }
    
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            setUpManager()
            checkAutorization()
        } else {
            
            showAlertLocation(title: "У Вас выключена служба геолокации", message: "Хотитие включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES")!)
            
        }
        
    }
    func setUpManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkAutorization(){
        switch CLLocationManager.authorizationStatus(){
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            showAlertLocation(title: "Вы запретили использование местоположение", message: "Хотитие включить?", url: URL(string: UIApplication.openSettingsURLString)!)
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            self.mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
            
        }
    }
    
    
    func showAlertLocation(title: String, message: String?, url: URL? ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settings = UIAlertAction(title: "Настройки", style: .default) {(alert) in
            if let url = url{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        let cancelAlert = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alert.addAction(settings)
        alert.addAction(cancelAlert)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func placePins() {
        
        var coords: [CLLocationCoordinate2D] = []
        for i in marker {
            coords.append(i.coordinate)
        }
        
        
        let title = "PizzaQueen"
        var count = 0
        
        for i in coords.indices {
            let annotation = MKPointAnnotation()
            annotation.subtitle = marker[count].street
            annotation.coordinate = coords[i]
            annotation.title = title
            count += 1
            
            
            mapView.addAnnotation(annotation)
        }
    }
    
}



extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAutorization()
    }
}





