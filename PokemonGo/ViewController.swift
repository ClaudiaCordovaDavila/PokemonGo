//
//  ViewController.swift
//  PokemonGo
//
//  Created by Mac  Tecsup on 27/11/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var  ubicacion = CLLocationManager()
    var contActualizaciones = 0
    var pokemons:[Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ubicacion.delegate = self
        pokemons = obtenerPokemons()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.delegate = self
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                if let coord = self.ubicacion.location?.coordinate{
                    let pin = MKPointAnnotation()
                    pin.coordinate = coord
                    let randomLat = (Double(arc4random_uniform(200))-100.0)/5000.0
                    let randomLon = (Double(arc4random_uniform(200))-100.0)/5000.0
                    pin.coordinate.longitude += randomLon
                    pin.coordinate.latitude += randomLat
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        pinView.image = UIImage(named:"mew")
        
        var frame = pinView.frame
        frame.size.height = 50
        frame.size.width = 50
        pinView.frame = frame
        
        return pinView
    }
    
    @IBAction func centrarTapped(_ sender: Any) {
        if let coord = ubicacion.location?.coordinate{
            let region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
    }
}

