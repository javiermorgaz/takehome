//
//  APIRouter.swift
//  TakeHome
//
//  Created by Jmorgaz on 17/3/21.
//

import Foundation

enum APIRouter {

    case pois(_ bounds: Bounds)

    var method: String {
        switch self {
        case .pois: return "GET"
        }
    }

    var version: String {
        switch self {
        case .pois: return "v1"
        }
    }

    var path: String {
        switch self {
        case .pois: return "/PoiService/poi/\(version)"
        }
    }

    var quertItems: [URLQueryItem] {
        switch self {
        case .pois(let bounds): return [
            URLQueryItem(name: "p1Lon", value: String(bounds.p1Lon)),
            URLQueryItem(name: "p1Lat", value: String(bounds.p1Lat)),
            URLQueryItem(name: "p2Lon", value: String(bounds.p2Lon)),
            URLQueryItem(name: "p2Lat", value: String(bounds.p2Lat)), ]
        }
    }
}
