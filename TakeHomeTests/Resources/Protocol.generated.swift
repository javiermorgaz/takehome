// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
@testable import TakeHome
import UIKit
import MapKit
import Combine
#elseif os(OSX)
import AppKit
#endif














class BaseViewMock: BaseView {
    var presenter: Presenter?

    //MARK: - showTitle

    var showTitleCallsCount = 0
    var showTitleCalled: Bool {
        return showTitleCallsCount > 0
    }
    var showTitleReceivedTitle: String?
    var showTitleReceivedInvocations: [String] = []
    var showTitleClosure: ((String) -> Void)?

    func showTitle(_ title: String) {
        showTitleCallsCount += 1
        showTitleReceivedTitle = title
        showTitleReceivedInvocations.append(title)
        showTitleClosure?(title)
    }

    //MARK: - showInfoView

    var showInfoViewMessageCallsCount = 0
    var showInfoViewMessageCalled: Bool {
        return showInfoViewMessageCallsCount > 0
    }
    var showInfoViewMessageReceivedMessage: String?
    var showInfoViewMessageReceivedInvocations: [String] = []
    var showInfoViewMessageClosure: ((String) -> Void)?

    func showInfoView(message: String) {
        showInfoViewMessageCallsCount += 1
        showInfoViewMessageReceivedMessage = message
        showInfoViewMessageReceivedInvocations.append(message)
        showInfoViewMessageClosure?(message)
    }

    //MARK: - removeInfoView

    var removeInfoViewCallsCount = 0
    var removeInfoViewCalled: Bool {
        return removeInfoViewCallsCount > 0
    }
    var removeInfoViewClosure: (() -> Void)?

    func removeInfoView() {
        removeInfoViewCallsCount += 1
        removeInfoViewClosure?()
    }

}
class GetPoisUseCaseMock: GetPoisUseCase {

    //MARK: - execute

    var executeBoundsCallsCount = 0
    var executeBoundsCalled: Bool {
        return executeBoundsCallsCount > 0
    }
    var executeBoundsReceivedBounds: Bounds?
    var executeBoundsReceivedInvocations: [Bounds] = []
    var executeBoundsReturnValue: AnyPublisher<PoisDTO, Error>!
    var executeBoundsClosure: ((Bounds) -> AnyPublisher<PoisDTO, Error>)?

    func execute(bounds: Bounds) -> AnyPublisher<PoisDTO, Error> {
        executeBoundsCallsCount += 1
        executeBoundsReceivedBounds = bounds
        executeBoundsReceivedInvocations.append(bounds)
        return executeBoundsClosure.map({ $0(bounds) }) ?? executeBoundsReturnValue
    }

}
class ListViewMock: ListView {
    var presenter: Presenter?

    //MARK: - update

    var updateItemsCallsCount = 0
    var updateItemsCalled: Bool {
        return updateItemsCallsCount > 0
    }
    var updateItemsReceivedItems: [MapPoi]?
    var updateItemsReceivedInvocations: [[MapPoi]] = []
    var updateItemsClosure: (([MapPoi]) -> Void)?

    func update(items: [MapPoi]) {
        updateItemsCallsCount += 1
        updateItemsReceivedItems = items
        updateItemsReceivedInvocations.append(items)
        updateItemsClosure?(items)
    }

    //MARK: - update

    var updateLocationCallsCount = 0
    var updateLocationCalled: Bool {
        return updateLocationCallsCount > 0
    }
    var updateLocationReceivedLocation: String?
    var updateLocationReceivedInvocations: [String] = []
    var updateLocationClosure: ((String) -> Void)?

    func update(location: String) {
        updateLocationCallsCount += 1
        updateLocationReceivedLocation = location
        updateLocationReceivedInvocations.append(location)
        updateLocationClosure?(location)
    }

    //MARK: - showTitle

    var showTitleCallsCount = 0
    var showTitleCalled: Bool {
        return showTitleCallsCount > 0
    }
    var showTitleReceivedTitle: String?
    var showTitleReceivedInvocations: [String] = []
    var showTitleClosure: ((String) -> Void)?

    func showTitle(_ title: String) {
        showTitleCallsCount += 1
        showTitleReceivedTitle = title
        showTitleReceivedInvocations.append(title)
        showTitleClosure?(title)
    }

    //MARK: - showInfoView

    var showInfoViewMessageCallsCount = 0
    var showInfoViewMessageCalled: Bool {
        return showInfoViewMessageCallsCount > 0
    }
    var showInfoViewMessageReceivedMessage: String?
    var showInfoViewMessageReceivedInvocations: [String] = []
    var showInfoViewMessageClosure: ((String) -> Void)?

    func showInfoView(message: String) {
        showInfoViewMessageCallsCount += 1
        showInfoViewMessageReceivedMessage = message
        showInfoViewMessageReceivedInvocations.append(message)
        showInfoViewMessageClosure?(message)
    }

    //MARK: - removeInfoView

    var removeInfoViewCallsCount = 0
    var removeInfoViewCalled: Bool {
        return removeInfoViewCallsCount > 0
    }
    var removeInfoViewClosure: (() -> Void)?

    func removeInfoView() {
        removeInfoViewCallsCount += 1
        removeInfoViewClosure?()
    }

}
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
class MapRoutableMock: MapRoutable {

    //MARK: - showList

    var showListLocationDelegateCallsCount = 0
    var showListLocationDelegateCalled: Bool {
        return showListLocationDelegateCallsCount > 0
    }
    var showListLocationDelegateReceivedArguments: (items: [MapPoi], location: CLLocationCoordinate2D?, delegate: MapViewDelegate)?
    var showListLocationDelegateReceivedInvocations: [(items: [MapPoi], location: CLLocationCoordinate2D?, delegate: MapViewDelegate)] = []
    var showListLocationDelegateClosure: (([MapPoi], CLLocationCoordinate2D?, MapViewDelegate) -> Void)?

    func showList(_ items: [MapPoi], location: CLLocationCoordinate2D?, delegate: MapViewDelegate) {
        showListLocationDelegateCallsCount += 1
        showListLocationDelegateReceivedArguments = (items: items, location: location, delegate: delegate)
        showListLocationDelegateReceivedInvocations.append((items: items, location: location, delegate: delegate))
        showListLocationDelegateClosure?(items, location, delegate)
    }

    //MARK: - dismiss

    var dismissCallsCount = 0
    var dismissCalled: Bool {
        return dismissCallsCount > 0
    }
    var dismissClosure: (() -> Void)?

    func dismiss() {
        dismissCallsCount += 1
        dismissClosure?()
    }

}
class MapViewMock: MapView {
    var presenter: Presenter?

    //MARK: - updateLocation

    var updateLocationBoundsCallsCount = 0
    var updateLocationBoundsCalled: Bool {
        return updateLocationBoundsCallsCount > 0
    }
    var updateLocationBoundsReceivedBounds: MapBounds?
    var updateLocationBoundsReceivedInvocations: [MapBounds] = []
    var updateLocationBoundsClosure: ((MapBounds) -> Void)?

    func updateLocation(bounds: MapBounds) {
        updateLocationBoundsCallsCount += 1
        updateLocationBoundsReceivedBounds = bounds
        updateLocationBoundsReceivedInvocations.append(bounds)
        updateLocationBoundsClosure?(bounds)
    }

    //MARK: - update

    var updatePoisCallsCount = 0
    var updatePoisCalled: Bool {
        return updatePoisCallsCount > 0
    }
    var updatePoisReceivedPois: [MapPoi]?
    var updatePoisReceivedInvocations: [[MapPoi]] = []
    var updatePoisClosure: (([MapPoi]) -> Void)?

    func update(pois: [MapPoi]) {
        updatePoisCallsCount += 1
        updatePoisReceivedPois = pois
        updatePoisReceivedInvocations.append(pois)
        updatePoisClosure?(pois)
    }

    //MARK: - select

    var selectPoiCallsCount = 0
    var selectPoiCalled: Bool {
        return selectPoiCallsCount > 0
    }
    var selectPoiReceivedPoi: MapPoi?
    var selectPoiReceivedInvocations: [MapPoi] = []
    var selectPoiClosure: ((MapPoi) -> Void)?

    func select(poi: MapPoi) {
        selectPoiCallsCount += 1
        selectPoiReceivedPoi = poi
        selectPoiReceivedInvocations.append(poi)
        selectPoiClosure?(poi)
    }

    //MARK: - showTitle

    var showTitleCallsCount = 0
    var showTitleCalled: Bool {
        return showTitleCallsCount > 0
    }
    var showTitleReceivedTitle: String?
    var showTitleReceivedInvocations: [String] = []
    var showTitleClosure: ((String) -> Void)?

    func showTitle(_ title: String) {
        showTitleCallsCount += 1
        showTitleReceivedTitle = title
        showTitleReceivedInvocations.append(title)
        showTitleClosure?(title)
    }

    //MARK: - showInfoView

    var showInfoViewMessageCallsCount = 0
    var showInfoViewMessageCalled: Bool {
        return showInfoViewMessageCallsCount > 0
    }
    var showInfoViewMessageReceivedMessage: String?
    var showInfoViewMessageReceivedInvocations: [String] = []
    var showInfoViewMessageClosure: ((String) -> Void)?

    func showInfoView(message: String) {
        showInfoViewMessageCallsCount += 1
        showInfoViewMessageReceivedMessage = message
        showInfoViewMessageReceivedInvocations.append(message)
        showInfoViewMessageClosure?(message)
    }

    //MARK: - removeInfoView

    var removeInfoViewCallsCount = 0
    var removeInfoViewCalled: Bool {
        return removeInfoViewCallsCount > 0
    }
    var removeInfoViewClosure: (() -> Void)?

    func removeInfoView() {
        removeInfoViewCallsCount += 1
        removeInfoViewClosure?()
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
class PoisAPIClientMock: PoisAPIClient {

    //MARK: - getPois

    var getPoisCallsCount = 0
    var getPoisCalled: Bool {
        return getPoisCallsCount > 0
    }
    var getPoisReceivedBounds: Bounds?
    var getPoisReceivedInvocations: [Bounds] = []
    var getPoisReturnValue: AnyPublisher<PoisDTO, Error>!
    var getPoisClosure: ((Bounds) -> AnyPublisher<PoisDTO, Error>)?

    func getPois(_ bounds: Bounds) -> AnyPublisher<PoisDTO, Error> {
        getPoisCallsCount += 1
        getPoisReceivedBounds = bounds
        getPoisReceivedInvocations.append(bounds)
        return getPoisClosure.map({ $0(bounds) }) ?? getPoisReturnValue
    }

}
class PresenterMock: Presenter {

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

}
