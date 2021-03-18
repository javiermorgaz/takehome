//
//  APICoreDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class APICoreDependencies: RootCoreDependencies {

    func provideRestClient(baseURL: String) -> RestClient {
        RestClient(baseUrl: baseURL)
    }
}
