//
//  UIDependences.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

class RootUIDependences {
    weak var root: UIDependences!
}

class UIDependences {
    private(set) static var shared = UIDependences.Builder().build()

    let core: CoreDependences
    let list: ListDependences
    let map: MapDependences

    init(core: CoreDependences,
         list: ListDependences,
         map: MapDependences
    ) {
        self.core = core
        self.list = list
        self.map = map

        list.root = self
        map.root = self
    }
}

extension UIDependences {

    class Builder {
        private var core = CoreDependences.shared
        private var list = ListDependences()
        private var map = MapDependences()

        func with(list: ListDependences) -> Builder {
            self.list = list
            return self
        }

        func with(map: MapDependences) -> Builder {
            self.map = map
            return self
        }

        func build() -> UIDependences {
            UIDependences(core: core,
                              list: list,
                              map: map)
        }
    }
}
