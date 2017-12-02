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
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }
    }
    
    func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if(contActualizaciones < 1){
            let region = MKCoordinateRegionMakeWithDistance(ubicacion.location!.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
            print("Ubicacion actualizada")
            print(region)
            print(contActualizaciones)
        }else{
            ubicacion.stopUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

