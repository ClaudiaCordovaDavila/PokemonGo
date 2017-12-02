//
//  ViewController.swift
//  PokemonGo
//
//  Created by Mac  Tecsup on 27/11/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var  ubicacion = CLLocationManager()
    var contActualizaciones = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ubicacion.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                if let coord = self.ubicacion.location?.coordinate{
                    let pin = MKPointAnnotation()
                    pin.coordinate = coord
                    self.mapView.addAnnotation(pin)
                }
            })
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }
    }
    
    func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if(contActualizaciones < 1){
            let region = MKCoordinateRegionMakeWithDistance(ubicacion.location!.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
        }else{
            ubicacion.stopUpdatingLocation()
        }
    }
    
    @IBAction func centrarTapped(_ sender: Any) {
        if let coord = ubicacion.location?.coordinate{
            let region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
    }
}

