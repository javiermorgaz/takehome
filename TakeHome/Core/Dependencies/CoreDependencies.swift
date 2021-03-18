//
//  CoreDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class RootCoreDependencies {
    weak var root: CoreDependencies!
}

class CoreDependencies {
    private(set) static var shared = CoreDependencies.Builder().build()

    let api: APICoreDependencies
    let pois: PoisCoreDependencies

    init(api: APICoreDependencies,
         pois: PoisCoreDependencies
    ) {
        self.api = api
        self.pois = pois

        api.root = self
        pois.root = self
    }
}

extension CoreDependencies {

    class Builder {
        private var api = APICoreDependencies()
        private var pois = PoisCoreDependencies()

        func with(api: APICoreDependencies) -> Builder {
            self.api = api
            return self
        }

        func with(pois: PoisCoreDependencies) -> Builder {
            self.pois = pois
            return self
        }

        func build() -> CoreDependencies {
            CoreDependencies(api: api,
                            pois: pois)
        }
    }
}
