//
//  CoreDependences.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class RootCoreDependences {
    weak var root: CoreDependences!
}

class CoreDependences {
    private(set) static var shared = CoreDependences.Builder().build()

    let api: APICoreDependences
    let pois: PoisCoreDependences

    init(api: APICoreDependences,
         pois: PoisCoreDependences
    ) {
        self.api = api
        self.pois = pois

        api.root = self
        pois.root = self
    }
}

extension CoreDependences {

    class Builder {
        private var api = APICoreDependences()
        private var pois = PoisCoreDependences()

        func with(api: APICoreDependences) -> Builder {
            self.api = api
            return self
        }

        func with(pois: PoisCoreDependences) -> Builder {
            self.pois = pois
            return self
        }

        func build() -> CoreDependences {
            CoreDependences(api: api,
                            pois: pois)
        }
    }
}
