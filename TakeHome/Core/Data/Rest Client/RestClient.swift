//
//  RestClient.swift
//  TakeHome
//
//  Created by Jmorgaz on 17/3/21.
//

import Foundation
import Combine

protocol RestClientProtocol {
    var baseUrl: String { get }
    func perform<T: Decodable>(_ router: APIRouter, _ decoder: JSONDecoder) -> AnyPublisher<T, Error>
}

class RestClient: RestClientProtocol {

    internal var baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func perform<T: Decodable>(_ router: APIRouter, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {

        let request = asURLRequest(router: router)

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> T in
                let value = try decoder.decode(T.self, from: result.data)
                return value }
            .mapError { error in
                return error }
            .eraseToAnyPublisher()
    }

    private func asURLRequest(router: APIRouter) -> URLRequest {
        let path = "\(baseUrl)\(router.path)"
        var components = URLComponents(string: path)
        components?.queryItems = router.quertItems

        var urlRequest = URLRequest(url: (components?.url)!)
        urlRequest.httpMethod = router.method

        return urlRequest
    }
}
