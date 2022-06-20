//
//  Crimes.swift
//  CrimeStats
//
//  Created by Stephen Clark on 20/06/2022.
//


typealias Crimes = [Crime]

// MARK: - Crime
struct Crime: Codable, Hashable {
    let category: CrimeCategory
    let locationType: LocationType
    let location: Location
    let context: String
    let outcomeStatus: OutcomeStatus?
    let persistentID: String
    let id: Int
    let locationSubtype: LocationSubtype
    let month: String

    enum CodingKeys: String, CodingKey {
        case category
        case locationType = "location_type"
        case location, context
        case outcomeStatus = "outcome_status"
        case persistentID = "persistent_id"
        case id
        case locationSubtype = "location_subtype"
        case month
    }
}

enum CrimeCategory: String, Codable, Hashable {
    case antiSocialBehaviour = "anti-social-behaviour"
    case bicycleTheft = "bicycle-theft"
    case burglary = "burglary"
    case criminalDamageArson = "criminal-damage-arson"
    case drugs = "drugs"
    case otherCrime = "other-crime"
    case otherTheft = "other-theft"
    case possessionOfWeapons = "possession-of-weapons"
    case publicOrder = "public-order"
    case robbery = "robbery"
    case shoplifting = "shoplifting"
    case theftFromThePerson = "theft-from-the-person"
    case vehicleCrime = "vehicle-crime"
    case violentCrime = "violent-crime"
}

// MARK: - Location
struct Location: Codable, Hashable {
    let latitude: String
    let street: Street
    let longitude: String
}

// MARK: - Street
struct Street: Codable, Hashable {
    let id: Int
    let name: String
}

enum LocationSubtype: String, Codable, Hashable {
    case empty = ""
    case station = "STATION"
}

enum LocationType: String, Codable, Hashable {
    case btp = "BTP"
    case force = "Force"
}


// MARK: - OutcomeStatus
struct OutcomeStatus: Codable, Hashable {
    let category: OutcomeStatusCategory
    let date: String
}

enum OutcomeStatusCategory: String, Codable, Hashable {
    case actionToBeTakenByAnotherOrganisation = "Action to be taken by another organisation"
    case awaitingCourtOutcome = "Awaiting court outcome"
    case formalActionIsNotInThePublicInterest = "Formal action is not in the public interest"
    case furtherActionIsNotInThePublicInterest = "Further action is not in the public interest"
    case furtherInvestigationIsNotInThePublicInterest = "Further investigation is not in the public interest"
    case investigationCompleteNoSuspectIdentified = "Investigation complete; no suspect identified"
    case localResolution = "Local resolution"
    case unableToProsecuteSuspect = "Unable to prosecute suspect"
    case underInvestigation = "Under investigation"
    case caution = "Offender given a caution"
    case drugsPossessionWarning = "Offender given a drugs possession warning"
}


