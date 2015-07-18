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
        //the minimumPress duration has to be 0.5 seconds
        longPress.minimumPressDuration = 0.5
        //add the recognizer to mapView
        mapView.addGestureRecognizer(longPress)
        
        //Set ViewController as mapView delegate
        mapView.delegate = self
    }
    
    func dropPin(gestureRecognizer: UIGestureRecognizer) {
        
        let tapPoint: CGPoint = gestureRecognizer.locationInView(mapView)
        let touchMapCoordinate: CLLocationCoordinate2D = mapView.convertPoint(tapPoint, toCoordinateFromView: mapView)
        
        if UIGestureRecognizerState.Began == gestureRecognizer.state {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let pin = Pin(annotationLatitude: touchMapCoordinate.latitude, annotationLongitude: touchMapCoordinate.longitude, context: appDelegate.managedObjectContext!)
            mapView.addAnnotation(pin)
            appDelegate.saveContext()
        }
    }
}

