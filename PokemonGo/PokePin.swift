//
//  PokePin.swift
//  PokemonGo
//
//  Created by Mac  Tecsup on 4/12/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit
import MapKit

class PokePin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    init(coord: CLLocationCoordinate2D) {
        self.coordinate = coord
    }
}
