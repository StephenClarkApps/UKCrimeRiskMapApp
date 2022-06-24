//
//  Constants.swift
//  MapApp
//
//  Created by Stephen Clark on 20/06/2022.
//

// https://data.police.uk/api/crimes-street/all-crime?lat=52.629729&lng=-1.131592&year=2022

import Foundation

class Constants {
    
    struct API {
        //static let apiKey = ""
        static let defaultScheme = "https"
        static let defaultHost = "data.police.uk/api/crimes-street"
        static let defaultPath = "/all-crime"

    }
}


// Scottish crime rates seem to be avaliable from a different API

/*
 http://statistics.gov.scot/slice?dataset=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Frecorded-crime&http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fdimension%2FcrimeOrOffence=http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fconcept%2Fcrime-or-offence%2Fall-crimes
 */
