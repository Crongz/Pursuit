//
//  MapViewController.swift
//  Pursuit
//
//  Created by George Ruan on 3/8/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    /** 
     *  Permissions should be working.
     *  Got Location Permission pop up.
     *  Inserted stuff in info.plist as well
     */
    
    
    // Figure out what this does
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.mapType = MKMapType.Standard
    }
    
    /* Current location button */
    @IBAction func zoomIn(sender: UIButton) {
        let userLocation = mapView.userLocation
        
        /* Span measured in meters */
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.location.coordinate, 500, 500)
        
        mapView.setRegion(region, animated: true)
    }
}