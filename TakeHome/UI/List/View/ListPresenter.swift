//
//  ListPresenter.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

protocol ListViewPresenter {
    func viewDidLoad()
    func didTapItem(index: Int)
}

final class ListPresenter: ListViewPresenter {

    private weak var view: ListView?
    private let items: [PoiItem]
    private weak var delegate: MapViewDelegate?

    init(view: ListView,
         items: [PoiItem],
         delegate: MapViewDelegate?) {
        self.view = view
        self.items = items
        self.delegate = delegate
    }

    // MARK: - ListViewPresenter

    func viewDidLoad() {
        view?.update(items: items)
    }

    func didTapItem(index: Int) {
        delegate?.didTapItem(index: index)
    }
}
