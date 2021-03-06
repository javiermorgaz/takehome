//
//  GetPoisUseCase.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Combine

struct Bounds {
    let p1Lon: Double
    let p1Lat: Double
    let p2Lon: Double
    let p2Lat: Double
}

// sourcery: AutoMockable
protocol GetPoisUseCase {
    func execute(bounds: Bounds) -> AnyPublisher<PoisDTO, Error>
}

struct GetPois: GetPoisUseCase {

    private let repository: PoisRepository

    init(repository: PoisRepository) {
        self.repository = repository
    }

    func execute(bounds: Bounds) -> AnyPublisher<PoisDTO, Error> {
        repository.getPois(bounds)
    }
}
