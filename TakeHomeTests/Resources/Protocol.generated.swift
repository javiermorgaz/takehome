// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
@testable import TakeHome
#elseif os(OSX)
import AppKit
#endif














class ListViewPresenterMock: ListViewPresenter {

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - didTapItem

    var didTapItemIndexCallsCount = 0
    var didTapItemIndexCalled: Bool {
        return didTapItemIndexCallsCount > 0
    }
    var didTapItemIndexReceivedIndex: Int?
    var didTapItemIndexReceivedInvocations: [Int] = []
    var didTapItemIndexClosure: ((Int) -> Void)?

    func didTapItem(index: Int) {
        didTapItemIndexCallsCount += 1
        didTapItemIndexReceivedIndex = index
        didTapItemIndexReceivedInvocations.append(index)
        didTapItemIndexClosure?(index)
    }

    //MARK: - didTapDoneButton

    var didTapDoneButtonCallsCount = 0
    var didTapDoneButtonCalled: Bool {
        return didTapDoneButtonCallsCount > 0
    }
    var didTapDoneButtonClosure: (() -> Void)?

    func didTapDoneButton() {
        didTapDoneButtonCallsCount += 1
        didTapDoneButtonClosure?()
    }

}
class MapViewPresenterMock: MapViewPresenter {

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - didTapListButton

    var didTapListButtonCallsCount = 0
    var didTapListButtonCalled: Bool {
        return didTapListButtonCallsCount > 0
    }
    var didTapListButtonClosure: (() -> Void)?

    func didTapListButton() {
        didTapListButtonCallsCount += 1
        didTapListButtonClosure?()
    }

    //MARK: - mapRegionDidChange

    var mapRegionDidChangeCallsCount = 0
    var mapRegionDidChangeCalled: Bool {
        return mapRegionDidChangeCallsCount > 0
    }
    var mapRegionDidChangeReceivedBounds: MapBounds?
    var mapRegionDidChangeReceivedInvocations: [MapBounds] = []
    var mapRegionDidChangeClosure: ((MapBounds) -> Void)?

    func mapRegionDidChange(_ bounds: MapBounds) {
        mapRegionDidChangeCallsCount += 1
        mapRegionDidChangeReceivedBounds = bounds
        mapRegionDidChangeReceivedInvocations.append(bounds)
        mapRegionDidChangeClosure?(bounds)
    }

}
