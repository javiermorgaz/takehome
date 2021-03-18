//
//  PoisCoreDependences.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class PoisCoreDependences: RootCoreDependences {

    private func providePoisRepository() -> PoisRepository {
        PoisRepository(poisAPIClient: providePoisAPIClient())
    }

    private func providePoisAPIClient() -> PoisAPIClient {
        PoisAPI(restClient: root.api.provideRestClient(baseURL: Constants.baseURL))
    }

    func provideGetPoisUseCase() -> GetPoisUseCase {
        GetPois(repository: providePoisRepository())
    }
}
