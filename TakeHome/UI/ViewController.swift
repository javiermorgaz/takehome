//
//  ViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 17/3/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var cancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testPois()
    }

    private func testPois() {
        let bounds = Bounds(p1Lon: 9.757589, p1Lat: 53.694865, p2Lon: 10.099891, p2Lat: 53.394655)

        PoisAPI(restClient: RestClient(baseUrl: Constants.baseURL)).getPois(bounds)
            .receive(on: DispatchQueue.main)
//            .map { ViewModel($0) }
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { data in
                print(data)
            })
            .store(in: &cancellable)

    }
}
