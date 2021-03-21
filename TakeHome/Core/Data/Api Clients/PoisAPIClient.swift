//
//  PoisAPIClient.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Combine

// sourcery: AutoMockable
protocol PoisAPIClient {
    func getPois(_ bounds: Bounds) -> AnyPublisher<PoisDTO, Error>
}

class PoisAPI: PoisAPIClient {

    private let restClient: RestClient

    init(restClient: RestClient) {
        self.restClient = restClient
    }

    func getPois(_ bounds: Bounds) -> AnyPublisher<PoisDTO, Error> {
        restClient.perform(.pois(bounds))
    }
}
