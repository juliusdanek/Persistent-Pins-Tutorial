//
//  Pin.swift
//  Persistent-Pins
//
//  Created by Julius Danek on 7/17/15.
//  Copyright (c) 2015 Julius Danek. All rights reserved.
//

import Foundation
import CoreData
import MapKit

@objc(Pin)

class Pin: NSManagedObject, MKAnnotation {

    //our managed attributes
    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(annotationLatitude: Double, annotationLongitude: Double, context: NSManagedObjectContext) {
        
        //initializing with entity "Pin"
        let entity = NSEntityDescription.entityForName("Pin", inManagedObjectContext: context)!
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        //assigning our latitude. we are converting our double into an NSNumber so we can enter it into coreData
        latitude = NSNumber(double: annotationLatitude)
        
        longitude = NSNumber(double: annotationLongitude)
    }
    
    //returning the coordinate so as to conform to MKAnnotation protocol
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude as Double, longitude: longitude as Double)
    }

}
