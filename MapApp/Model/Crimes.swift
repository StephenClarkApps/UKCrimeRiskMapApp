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
    let locationSubtype: String//LocationSubtype
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

// MARK: - CrimeCategory
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

// MARK: - LocationType
enum LocationType: String, Codable, Hashable {
    case btp = "BTP"
    case force = "Force"
}


// MARK: - OutcomeStatus
struct OutcomeStatus: Codable, Hashable {
    let category: OutcomeStatusCategory
    let date: String
}

// MARK: - OutcomeStatusCategory
enum OutcomeStatusCategory: String, Codable, Hashable {
    case awaitingCourtOutcome = "Awaiting court outcome"
    case courtResultUnavilable = "Court result unavailable"
    case courtCaseUnableToProceed = "Court case unable to proceed"
    case localResolution = "Local resolution"
    case noFurtherAction = "Investigation complete; no suspect identified"
    case offenderDeprivedOfProperty = "Offender deprived of property"
    case fined = "Offender fined"
    case absoluteDischarge = "Offender given absolute discharge"
    case cautioned = "Offender given a caution"
    case drugsPossessionWarning = "Offender given a drugs possession warning"
    case penaltyNotice = "Offender given penalty notice"
    case communitySentence = "Offender given community sentence"
    case conditionalDischarge = "Offender given conditional discharge"
    case suspendedSentence = "Offender given suspended prison sentence"
    case imprisoned = "Offender sent to prison"
    case otherCourtDisposal = "Offender otherwise dealt with"
    case compensation = "Offender ordered to pay compensation"
    case sentencedInAnotherCase = "Suspect charged as part of another case"
    case charged = "Suspect charged"
    case notGuilty = "Defendant found not guilty"
    case sentToCrownCourt = "Defendant sent to Crown Court"
    case unableToProsecute = "Unable to prosecute suspect"
    case formalActionIsNotInThePublicInterest = "Formal action is not in the public interest"
    case actionToBeTakenByAnotherOrganisation = "Action to be taken by another organisation"
    case furtherInvestigationIsNotInThePublicInterest = "Further investigation is not in the public interest"
    case furtherActionIsNotInThePublicInterest = "Further action is not in the public interest"
    case underInvestigation = "Under investigation"
    case statusUpdateUnavailable = "Status update unavailable"
}

/*
 [
 {
 "url": "all-crime",
 "name": "All crime"
 },
 {
 "url": "anti-social-behaviour",
 "name": "Anti-social behaviour"
 },
 {
 "url": "bicycle-theft",
 "name": "Bicycle theft"
 },
 {
 "url": "burglary",
 "name": "Burglary"
 },
 {
 "url": "criminal-damage-arson",
 "name": "Criminal damage and arson"
 },
 {
 "url": "drugs",
 "name": "Drugs"
 },
 {
 "url": "other-theft",
 "name": "Other theft"
 },
 {
 "url": "possession-of-weapons",
 "name": "Possession of weapons"
 },
 {
 "url": "public-order",
 "name": "Public order"
 },
 {
 "url": "robbery",
 "name": "Robbery"
 },
 {
 "url": "shoplifting",
 "name": "Shoplifting"
 },
 {
 "url": "theft-from-the-person",
 "name": "Theft from the person"
 },
 {
 "url": "vehicle-crime",
 "name": "Vehicle crime"
 },
 {
 "url": "violent-crime",
 "name": "Violence and sexual offences"
 },
 {
 "url": "other-crime",
 "name": "Other crime"
 }
 ]
 */
