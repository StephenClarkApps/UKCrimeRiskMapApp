//
//  ContentViewModel.swift
//  MapApp
//
//  Created by Stephen Clark on 20/06/2022.
//

import MapKit
import Combine

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                               span: MapDetails.defaultSpan)
    
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager?.delegate = self
            locationManager?.startUpdatingLocation()
        } else {
            print("Show an alert")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You have denied this app location permissions, go into setting to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            
            let center = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
            region = MKCoordinateRegion(center: center,
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            
        @unknown default:
            break
        }
    }
    
    // MARK: - CRIMES STUFF
    var cancellable: AnyCancellable?
    
    @Published var crimes: Crimes = Crimes()
    @Published var requestSucceded: Bool = false
    
    // Alert parameters
    @Published var showAlert: Bool = false

    
    public func setCrimes(crimes: Crimes) {
        self.crimes = crimes
    }

    
    /// Trigger a querry to our network data service layer to check for cars
    public func searchForCrimes() {
        
        let center = locationManager?.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)

        cancellable = CrimesDataService().fetchCrimesForLocation(lat: center.latitude, long: center.longitude).sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished:
                self?.requestSucceded = true
            case .failure(let error):
                print(error)
                self?.requestSucceded = false
                self?.showAlert = true
            }
        }, receiveValue: { [weak self] crimesContainer in
            guard let strongSelf = self else { return }
            
            strongSelf.crimes = crimesContainer
        })
        
    }
    
    // MARK: - LOCATION STUFF
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        region = MKCoordinateRegion(center: locations[0].coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}
