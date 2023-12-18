//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/12/23.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable

class BusinessModel: NSObject, CLLocationManagerDelegate {
   var query: String = ""
   var businesses  = [Business]()
   var selectedBusiness: Business?
    
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses() {
        
        Task{
            businesses = await service.businessSearch(userLocation: currentUserLocation) ?? [Business]()
        }
    }
    
    func getUserLocation() {
        // Check if we have permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            locationManager.requestLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = locations.last?.coordinate
        
        if currentUserLocation != nil {
            getBusinesses()
        }
        
        manager.stopUpdatingLocation()
    }
}
