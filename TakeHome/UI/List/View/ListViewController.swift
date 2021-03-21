//
//  ListViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit

protocol ListView: BaseView {
    func update(items: [MapPoi])
    func update(location: String)
}

class ListViewController: BaseViewController, ListView {

    enum Keys {
        static let cellIdentifier = "ItemCellView"
        static let estimatedRowHeight: CGFloat = 240
        static let headerHeight: CGFloat = 60
    }

    @IBOutlet weak private var tableView: UITableView!
    private let headerView = Bundle.main.loadNibNamed("ListViewHeader", owner: self, options: nil)?.first as? ListViewHeader

    private var items =  [MapPoi]() {
        didSet {
            tableView.reloadData()
        }
    }

    var presenter: ListPresenter!

    override func viewDidLoad() {

        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        presenter.viewDidLoad()
    }

    // MARK: - ListView

    func update(items: [MapPoi]) {
        self.items = items
    }

    func update(location: String) {
        headerView?.subtitleLabel.text = location
    }

    // MARK: - Private

    private func setupTableView() {

        tableView.register(UINib(nibName: String(describing: ItemCellView.self), bundle: nil), forCellReuseIdentifier: Keys.cellIdentifier)
        tableView.estimatedRowHeight = Keys.estimatedRowHeight
        tableView.sectionHeaderHeight = Keys.headerHeight
        tableView.separatorColor = UIColor.primary
    }

    private func setupNavigationBar() {

        showTitle(NSLocalizedString("vehicles", comment: "Title"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
    }

    @objc fileprivate func didTapDoneButton(_ sender: AnyObject) {
        presenter.didTapDoneButton()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellIdentifier, for: indexPath) as! ItemCellView
        let item = items[indexPath.row]
        cell.configure(id: item.id, vehicle: item.type, status: item.state)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapItem(index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
}

private extension Selector {
    static let didTapListButton = #selector(ListViewController.didTapDoneButton)
}
