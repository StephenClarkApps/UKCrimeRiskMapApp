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
    
    @State private var borderColor = Color.clear
    
    @State private var riskStatus = "UNKNOWN"
        
    var body: some View {
        
        NavigationView {
            VStack {
                
                Text("Shows crime statistics for crimes withing one mile of you.").font(.subheadline).padding()
                Text("Whilst (potentially) useful in England, please note these stats are not representative in *Scotland* as only figures from the British Transport Police will be shown.").font(.footnote).padding()
                
                if (self.viewModel.crimes.count > 0) {
                    HStack {
                        Text("Total Crimes: \(String(self.viewModel.crimes.count))").bold()
                    }.padding(.top, 10)
                    Text("*These are for the most recent month on record").font(Font(UIFont.systemFont(ofSize: 10))).padding(0)
                    Text("RISK LEVEL: \(self.riskStatus)").font(.system(.subheadline, weight: .light)).foregroundColor(borderColor).padding(.top, 15)
                }
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .accentColor(Color(.systemPink))
                    .onAppear {
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                    .border(borderColor, width: 5.0)
                    .padding()
                
                if (self.viewModel.crimes.count > 0) {
                    VStack {
                        
                        HStack {
                            Image("icnViolentCrime").frame(width: 27, height: 27)
                            Text("Violent Crimes: \(String(self.viewModel.crimes.filter{ $0.category == .violentCrime }.count))")
                            Spacer()
                        }.padding(2)
                        
                        HStack {
                            Image("icnAntiSocialBehaviour").frame(width: 27, height: 27)
                            Text("Anti Social Behaviour: \(String(self.viewModel.crimes.filter{ $0.category == .antiSocialBehaviour }.count))")
                            Spacer()
                        }.padding(2)
                        HStack {
                            Image("icnBurglary").frame(width: 27, height: 27)
                            Text("Burglary: \(String(self.viewModel.crimes.filter{ $0.category == .burglary }.count))")
                            Spacer()
                        }.padding(2)
                        
                        HStack {
                            Image("icnPersonalTheft").frame(width: 27, height: 27)
                            Text("Personal Theft: \(String(self.viewModel.crimes.filter{ $0.category == .theftFromThePerson }.count))")
                            Spacer()
                        }.padding(2)
                        
                    }.padding(.leading, 15)
                }
                
                Button {
                    self.viewModel.searchForCrimes()
                } label: {
                    Text("Get Crime Stats")
                }.padding()
                    .onChange(of: self.viewModel.crimes) { newValue in
                        if ((self.viewModel.crimes.filter{ $0.category == .violentCrime }.count) > 320) {
                            self.borderColor = .red
                            self.riskStatus = "HIGH RISK"
                        } else if ((self.viewModel.crimes.filter{ $0.category == .violentCrime }.count) > 220) {
                            self.borderColor = .orange
                            self.riskStatus = "MODERATE RISK"
                        } else {
                            self.borderColor = .green
                            self.riskStatus = "LOW RISK (but always stay aware)"
                        }
                    }
                
            }.navigationTitle("Crime Risk UK")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
