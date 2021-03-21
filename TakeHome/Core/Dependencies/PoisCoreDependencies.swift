//
//  PoisCoreDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class PoisCoreDependencies: RootCoreDependencies {

    private func providePoisRepository() -> PoisRepository {
        PoisRepository(poisAPIClient: providePoisAPIClient())
    }

    func providePoisAPIClient() -> PoisAPIClient {
        PoisAPI(restClient: root.api.provideRestClient(baseURL: Constants.baseURL))
    }

    func provideGetPoisUseCase() -> GetPoisUseCase {
        GetPois(repository: providePoisRepository())
    }
}
