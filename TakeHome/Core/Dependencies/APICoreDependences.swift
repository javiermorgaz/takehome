//
//  APICoreDependences.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class APICoreDependences: RootCoreDependences {

    func provideRestClient(baseURL: String) -> RestClient {
        RestClient(baseUrl: baseURL)
    }
}
