//
//  PoisDTO.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

struct PoisDTO: Codable {
    let poiList: [Poi]
}

struct Poi: Codable {
    let id: Int
    let coordinate: Coordinate
    let state: String
    let type: String?
    let heading: Double
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}
