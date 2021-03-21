//
//  TestUtils.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

import Foundation

class TestUtils {

    public static func jsonModel<T: Decodable>(withName name: String) -> T? {

        let bundle = Bundle(for: self)
        guard
            let filePath = bundle.path(forResource: name, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .alwaysMapped),
            let value = try? JSONDecoder().decode(T.self, from: data)
        else {
            print("JSON FILE ERROR")
            return nil
        }
        return value
    }
}
