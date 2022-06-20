//
//  ContentView.swift
//  MapApp
//
//  Created by Stephen Clark on 20/06/2022.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
        
    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
            
            Text("Total Crimes: \(String(self.viewModel.crimes.count))")
            
            Button {
                self.viewModel.searchForCrimes()
            } label: {
                Text("Get Crime Stats")
            }
            

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
