//
//  ListViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

protocol ListView: BaseView {
    func update(items: [PoiItem])
}

class ListViewController: BaseViewController, ListView {

    enum Keys {
        static let cellIdentifier = "ItemCellView"
        static let estimatedRowHeight: CGFloat = 240
    }

    @IBOutlet weak private var tableView: UITableView!
    private var items =  [PoiItem]() {
        didSet {
            tableView.reloadData()
        }
    }

    var presenter: ListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: String(describing: ItemCellView.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Keys.cellIdentifier)
        tableView.estimatedRowHeight = Keys.estimatedRowHeight
        presenter.viewDidLoad()
    }

    // MARK: - ListView

    func update(items: [PoiItem]) {
        self.items = items
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellIdentifier, for: indexPath) as! ItemCellView
        let item = items[indexPath.row]
        cell.configure(item.title)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapItem(index: indexPath.row)
    }
}
