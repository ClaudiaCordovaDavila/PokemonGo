//
//  PokedexViewController.swift
//  PokemonGo
//
//  Created by Mac  Tecsup on 4/12/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
