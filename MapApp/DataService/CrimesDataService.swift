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
    
    
    func fetchCrimesForLocation(lat: Double, long: Double) -> AnyPublisher<Crimes, Error> {
        // Constructing URL string manually
        let urlString = "\(Constants.API.defaultScheme)://\(Constants.API.defaultHost)\(Constants.API.defaultPath)?lat=\(lat)&lng=\(long)"
        
        guard let url = URL(string: urlString) else {
            // Handle invalid URL
            let error = URLError(.badURL)
            return Fail(error: error).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
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

