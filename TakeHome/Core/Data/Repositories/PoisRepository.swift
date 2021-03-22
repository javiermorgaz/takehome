//
//  PoisRepository.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Combine

final class PoisRepository {

    private let poisAPIClient: PoisAPIClient

    init(poisAPIClient: PoisAPIClient) {
        self.poisAPIClient = poisAPIClient
    }

    func getPois(_ bounds: Bounds) -> AnyPublisher<PoisDTO, Error> {
        poisAPIClient.getPois(bounds)
    }
}
