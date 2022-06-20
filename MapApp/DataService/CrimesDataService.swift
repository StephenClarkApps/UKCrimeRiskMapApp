//
//  CrimesDataService.swift
//  MapApp
//
//  Created by Stephen Clark on 20/06/2022.
//

import Combine
import SwiftUI
import Foundation
import CoreLocation


final class CrimesDataService: CrimesFetchingService {
    
    private var lat: Double = 53.4084
    private var long: Double = -2.9916
    
    
    func fetchCrimesForLocation(lat: Double, long: Double) -> AnyPublisher<Crimes, Error> {
        
        var components = URLComponents()
        components.scheme = Constants.API.defaultScheme
        components.host = Constants.API.defaultHost
        components.path = Constants.API.defaultPath
        components.queryItems = [URLQueryItem(name: "lat", value: String(lat)),
                                 URLQueryItem(name: "lng", value: String(long))]
        
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: Crimes.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

// We can use protocols to describe what our data service offers, allowing us to
// create mock objects in our unit testing which also conform to this protocol
protocol CrimesFetchingService {
    func fetchCrimesForLocation(lat: Double, long: Double) -> AnyPublisher<Crimes, Error>
}

