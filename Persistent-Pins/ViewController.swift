//
//  ViewController.swift
//  Persistent-Pins
//
//  Created by Julius Danek on 7/17/15.
//  Copyright (c) 2015 Julius Danek. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //long press gesture recognizer allowing us call our "dropPin" method.
        var longPress = UILongPressGestureRecognizer(target: self, action: "dropPin:")
        longPress.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPress)
        
        //Set ViewController as mapView delegate
        mapView.delegate = self
        
        
    }
}

