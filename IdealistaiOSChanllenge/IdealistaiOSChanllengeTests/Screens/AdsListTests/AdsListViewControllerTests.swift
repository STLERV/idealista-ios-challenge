//
//  AdsListViewControllerTests.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//

import XCTest
@testable import IdealistaiOSChanllenge

final class AdsListViewControllerTests: XCTestCase {

    var sut: AdsListViewController!
    var viewMock: AdsListViewMock!
    var presenterMock: AdsListPresenterMock!
    var delegateMock: AdsListCoordinatorMock!
    
    override func setUp()  {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        presenterMock = AdsListPresenterMock()
        viewMock = AdsListViewMock()
        sut = AdsListViewController(presenter: presenterMock)
        delegateMock = AdsListCoordinatorMock()
        sut.delegate = delegateMock
    }

    func releaseSut() {
        sut = nil
        presenterMock = nil
        viewMock = nil
        delegateMock = nil
    }

    func testSutIsntNil(){
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.presenter)
    }

    func testNumRowInSection() {
        _ = sut.view
        _ = sut.tableView
        let numSut = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        let numTest = presenterMock.getAdsCount()
        XCTAssertEqual(numSut, numTest)
    }

    func testDidItemRowAt() {
        _ = sut.view
        let tableView = sut.tableView
        sut.tableView(tableView!, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(1, delegateMock.goToDetailScreenCount)
    }
}
    
