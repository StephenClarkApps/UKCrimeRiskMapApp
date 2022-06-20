//
//  MapAppApp.swift
//  MapApp
//
//  Created by Stephen Clark on 20/06/2022.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var contentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentViewModel)
        }
    }
}
