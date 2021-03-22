//
//  PoisDTO.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

enum State: String, Decodable {
    case active = "ACTIVE"
    case inactive = "INACTIVE"
}

enum PoiType: String, Decodable {
    case taxi = "TAXI"
}

struct PoisDTO: Decodable {
    let poiList: [Poi]
}

struct Poi: Decodable {
    let id: Int
    let coordinate: Coordinate
    let state: State
    let type: PoiType
    let heading: Double
}

struct Coordinate: Decodable {
    let latitude: Double
    let longitude: Double
}
