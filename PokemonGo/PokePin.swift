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
    var pokemon : Pokemon
    init(coord: CLLocationCoordinate2D, pokemon:Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
