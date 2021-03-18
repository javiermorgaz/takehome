//
//  UIDependencies.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class RootUIDependencies {
    weak var root: UIDependencies!
}

class UIDependencies {
    private(set) static var shared = UIDependencies.Builder().build()

    let core: CoreDependencies
    let list: ListDependencies
    let map: MapDependencies

    init(core: CoreDependencies,
         list: ListDependencies,
         map: MapDependencies
    ) {
        self.core = core
        self.list = list
        self.map = map

        list.root = self
        map.root = self
    }
}

extension UIDependencies {

    class Builder {
        private var core = CoreDependencies.shared
        private var list = ListDependencies()
        private var map = MapDependencies()

        func with(list: ListDependencies) -> Builder {
            self.list = list
            return self
        }

        
        func with(map: MapDependencies) -> Builder {
            self.map = map
            return self
        }

        func build() -> UIDependencies {
            UIDependencies(core: core,
                              list: list,
                              map: map)
        }
    }
}
