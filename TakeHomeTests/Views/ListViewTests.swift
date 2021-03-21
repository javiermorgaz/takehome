//
//  ListViewTests.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

// swiftlint:disable overridden_super_call

import XCTest
import Nimble
@testable import TakeHome

class ListViewTests: XCTestCase {

    private var presenter: ListViewPresenterMock!

    override func setUpWithError() throws {

        presenter = ListViewPresenterMock()
    }

    func test_view_did_load() {

        let view = givenView()
        view.viewDidLoad()

        expect(self.presenter.viewDidLoadCalled).to(beTrue())
    }

    func test_did_tap_in_item() {

        let view = givenView()
        view.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))

        expect(self.presenter.didTapItemIndexCalled).to(beTrue())
        expect(self.presenter.didTapItemIndexReceivedIndex).to(equal(0))
    }

    private func givenView() -> ListViewController {

        let view = ListViewController()
        view.loadView()
        view.listPresenter = presenter
        return view
    }
}
