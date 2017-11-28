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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ubicacion.delegate = self
        ubicacion.requestWhenInUseAuthorization()
        ubicacion.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

